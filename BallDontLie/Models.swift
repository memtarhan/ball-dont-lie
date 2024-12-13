//
//  Models.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 13.12.2024.
//

import Foundation

enum APIError: Error {
    case badURL
}

protocol APIResponse: Decodable { }

// MARK: - StandingsResponse

struct StandingsResponse: APIResponse {
    let standings: [Standing]
}

// MARK: - Standing

struct Standing: APIResponse {
    let teamName: String
    let stats: [Stat]

    enum CodingKeys: String, CodingKey {
        case teamName = "team_name"
        case stats
    }
}

// MARK: - Stat

// MARK: - Stat
struct Stat: APIResponse {
    let name: String
    let value: String
    let shortName: String
    let color: String

    enum CodingKeys: String, CodingKey {
        case name, value
        case shortName = "short_name"
        case color
    }
}

// MARK: - ScoresResponse

struct ScoresResponse: APIResponse {
    let title: String
    let scores: [[Score]]
}

// MARK: - Score

struct Score: APIResponse {
    let teamName, score: String

    enum CodingKeys: String, CodingKey {
        case teamName = "team_name"
        case score
    }
}
