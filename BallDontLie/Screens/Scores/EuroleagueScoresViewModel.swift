//
//  EuroleagueScoresViewModel.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 13.12.2024.
//

import Foundation

struct ScoreModel: Identifiable {
    let firstTeam: TeamScoreModel
    let secondTeam: TeamScoreModel

    var id: String { firstTeam.teamName }

    static let sample = [ScoreModel(firstTeam: TeamScoreModel(teamName: "ABC", score: "120", isWinner: true),
                                    secondTeam: TeamScoreModel(teamName: "BNC", score: "90", isWinner: false)),
                         ScoreModel(firstTeam: TeamScoreModel(teamName: "XCV", score: "120", isWinner: false),
                                    secondTeam: TeamScoreModel(teamName: "KLO", score: "150", isWinner: true))]
}

struct TeamScoreModel: Identifiable {
    let teamName: String
    let score: String
    let isWinner: Bool

    var id: String { teamName }
}

@MainActor
class EuroleagueScoresViewModel: ObservableObject, EuroleagueScoresService {
    @Published var scores: [ScoreModel] = []

    func handleScores() async {
        let response = try! await getScores()

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
}
