//
//  EuroleagueViewModel.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 5.01.2025.
//

import Foundation

@MainActor
class EuroleagueViewModel: ObservableObject, EuroleagueScoresService, EuroleagueStandingsService {
    @Published var loading: Bool = true
    @Published var scores: [ScoreModel] = []
    @Published var standings: [StandingModel] = []

    func handleData() async {
        async let scores = getScores()
        async let standings = getStandings()

        let response = try! await [scores, standings]

        handleScores(response: response[0] as! ScoresResponse)
        handleStandings(response: response[1] as! StandingsResponse)
        
        loading = false
    }

    private func handleScores(response: ScoresResponse) {
        let scoreModels = response.scores.map { scoreResponse in
            let firstTeam = TeamScoreModel(
                teamName: scoreResponse[0].teamName,
                score: scoreResponse[0].score,
                isWinner: scoreResponse[0].score > scoreResponse[1].score
            )

            let secondTeam = TeamScoreModel(
                teamName: scoreResponse[1].teamName,
                score: scoreResponse[1].score,
                isWinner: scoreResponse[1].score > scoreResponse[0].score
            )

            return ScoreModel(firstTeam: firstTeam, secondTeam: secondTeam)
        }

        scores = scoreModels
    }

    private func handleStandings(response: StandingsResponse) {
        let standingModels = response.standings.enumerated().map { index, standing in
            StandingModel(name: standing.teamName,
                          seat: "\(index + 1)",
                          stats: standing.stats.map { stat in
                              StatModel(description: stat.shortName,
                                        value: stat.value,
                                        color: stat.color)
                          })
        }

        standings = standingModels
    }
}
