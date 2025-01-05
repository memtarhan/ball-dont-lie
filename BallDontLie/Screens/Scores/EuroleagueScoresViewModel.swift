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

    static let sample = [ScoreModel(firstTeam: TeamScoreModel(teamName: "ABC", score: 120, isWinner: true),
                                    secondTeam: TeamScoreModel(teamName: "BNC", score: 90, isWinner: false)),
                         ScoreModel(firstTeam: TeamScoreModel(teamName: "XCV", score: 50, isWinner: false),
                                    secondTeam: TeamScoreModel(teamName: "KLO", score: 60, isWinner: true))]
}

struct TeamScoreModel: Identifiable {
    let teamName: String
    let score: Int
    let isWinner: Bool

    var id: String { teamName }
}

