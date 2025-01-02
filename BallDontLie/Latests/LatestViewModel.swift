//
//  LatestViewModel.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 2.01.2025.
//

import Foundation

@MainActor
class LatestViewModel: ObservableObject {
    @Published var loading: Bool = true
    @Published var latestGames: [NBAScoreUpperHeader] = []
    @Published var topPerformers: [TopPerformerModel] = []
    @Published var statLeaders: [StatLeaderModel] = []

    private let service = LatestService()

    func fetchLatest() async {
        async let games = service.getLatestScores()
        async let performers = service.getTopPerformers()
        async let leaders = service.getStatLeaders()

        let response = try! await [games, performers, leaders]

        handleLatestGames(response: response[0] as! LatestScoresResponse)
        handleTopPerformers(response: response[1] as! TopPerformersResponse)
        handleStatLeaders(response: response[2] as! StatLeadersResponse)
        
        loading = false 
    }

    private func handleLatestGames(response: LatestScoresResponse) {
        latestGames = response.latestScores
            .map { latestScore in
                NBAScoreUpperHeader(
                    awayTeamName: latestScore[0].teamName,
                    awayTeamScore: latestScore[0].teamScore,
                    homeTeamName: latestScore[1].teamName,
                    homeTeamScore: latestScore[1].teamScore,
                    isHomeTeamWinner: latestScore[1].teamStatus == .winner
                )
            }
    }

    private func handleTopPerformers(response: TopPerformersResponse) {
        topPerformers = response.performers
            .map { TopPerformerModel(
                playerName: $0.playerName,
                points: $0.rebounds,
                rebounds: $0.rebounds,
                assists: $0.assists
            )
            }
    }

    private func handleStatLeaders(response: StatLeadersResponse) {
        statLeaders = response.statLeaders
            .map {
                StatLeaderModel(
                    playerName: $0.playerName,
                    statType: $0.statType,
                    statValue: $0.statValue
                )
            }
    }
}
