//
//  ScoresResponse.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 22.12.2024.
//

import Foundation

// MARK: - ScoresResponse
struct ScoresResponseX: APIResponse {
    let date: Date
    let scores: [ScoreResponse]
}

// MARK: - Score
struct ScoreResponse: APIResponse {
    let teams: [TeamResponse]
    let scores: [[Int]]
    let stats: [[String]]
    let color: String
}

// MARK: - Team
struct TeamResponse: APIResponse {
    let teamName: String
    let teamScore: Int
    let teamStatus: TeamStatus

    enum CodingKeys: String, CodingKey {
        case teamName = "team_name"
        case teamScore = "team_score"
        case teamStatus = "team_status"
    }
}

enum TeamStatus: String, Codable {
    case loser = "loser"
    case winner = "winner"
}
