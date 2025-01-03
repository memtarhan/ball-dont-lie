//
//  NBAScoresViewModel.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 22.12.2024.
//

import Foundation

@MainActor
class NBAScoresViewModel: ObservableObject {
    @Published var data: [NBAScoreDisplayModel] = []
    @Published var title: String = "..."
    @Published var description: String? = nil

    private var currentDisplayedDate: Date?

    private let service = NBAService()

    func updateWithPreviousDate() {
        if let currentDisplayedDate {
            self.currentDisplayedDate = currentDisplayedDate.addingTimeInterval(-1 * 60 * 60 * 24)

        } else {
            currentDisplayedDate = Date()
        }

        refresh()
    }

    
    func updateWithNextDate() {
        if let currentDisplayedDate {
            self.currentDisplayedDate = currentDisplayedDate.addingTimeInterval(1 * 60 * 60 * 24)

        } else {
            currentDisplayedDate = Date()
        }

        refresh()
    }
    
    private func refresh() {
        data.removeAll()
        title = "..."

        Task {
            await fetchScores()
        }
    }
    
    func refreshToDate() {
        data.removeAll()
        title = "..."
        currentDisplayedDate = nil

        Task {
            await fetchScores()
        }
    }

    func fetchScores() async {
        let response = try! await service.getScores(date: currentDisplayedDate)
        let date = response.date
        currentDisplayedDate = date 
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        title = formatter.string(from: date)
        data = response.scores
            .map { score in
                NBAScoreDisplayModel(
                    upperHeader: NBAScoreUpperHeader(
                        awayTeamName: score.teams[0].teamName,
                        awayTeamScore: score
                            .teams[0].teamScore,
                        homeTeamName: score
                            .teams[1].teamName,
                        homeTeamScore: score
                            .teams[1].teamScore,
                        isHomeTeamWinner: score
                            .teams[1].teamStatus == .winner
                    ),
                    periods: self.getPeriodStatsData(score.scores),
                    color: score.color
                )
            }
        
        if data.isEmpty {
            description = "No games played on this date.\nPull to get the latest scores"
            
        } else {
            description = nil 
        }
    }

    func getPeriodName(forPeriodIndex index: Int) -> String {
        switch index {
        case 0: return "1st"
        case 1: return "2nd"
        case 2: return "3rd"
        case 3: return "4th"
        case 4...: return "OT\(index + 1)"
        default: return ""
        }
    }

    func getPeriodStatsData(_ data: [[Int]]) -> [NBAPeriodScore] {
        guard let away = data.first,
              let home = data.last else { return [] }

        var data = [NBAPeriodScore]()

        var index = 0
        for (away, home) in zip(away, home) {
            data.append(NBAPeriodScore(period: getPeriodName(forPeriodIndex: index),
                                       awayTeamScore: away,
                                       homeTeamScore: home))
            index += 1
        }

        return data
    }
}
