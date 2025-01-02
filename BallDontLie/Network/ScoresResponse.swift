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
    case loser
    case winner
}

// MARK: - LatestScoresResponse

struct LatestScoresResponse: APIResponse {
    let latestScores: [[TeamResponse]]

    enum CodingKeys: String, CodingKey {
        case latestScores = "latest_scores"
    }
}

// MARK: - TopPerformerResponse

struct TopPerformerResponse: APIResponse {
    let playerName: String
    let points: Int
    let rebounds: Int
    let assists: Int

    enum CodingKeys: String, CodingKey {
        case playerName = "player_name"
        case points = "pts"
        case rebounds = "trb"
        case assists = "ast"
    }
}

// MARK: - TopPerformersResponse

struct TopPerformersResponse: APIResponse {
    let performers: [TopPerformerResponse]
}

// MARK: - StatLeaderResponse

struct StatLeaderResponse: APIResponse {
    let playerName: String
    let statType: String
    let statValue: Double

    enum CodingKeys: String, CodingKey {
        case playerName = "player_name"
        case statType = "stat_type"
        case statValue = "stat_value"
    }
}

// MARK: - StatLeadersResponse

struct StatLeadersResponse: APIResponse {
    let statLeaders: [StatLeaderResponse]

    enum CodingKeys: String, CodingKey {
        case statLeaders = "stat_leaders"
    }
}
