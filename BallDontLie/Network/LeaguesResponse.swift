//
//  LeaguesResponse.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 21.12.2024.
//

import Foundation

// MARK: - LeaguesResponse

struct LeaguesResponse: APIResponse {
    let leagues: [LeagueResponse]
}

// MARK: - LeagueResponse

struct LeagueResponse: APIResponse {
    let title: String
    let header: [String]
    let statsHeader: [[String]]
    let standings: [StandingsResponseX]
    
    enum CodingKeys: String, CodingKey {
        case statsHeader = "stats_header"
        case title, header, standings
    }
}

// MARK: - StandingsResponseX

struct StandingsResponseX: APIResponse {
    let teamName: String
    let stats: [StatResponse]

    enum CodingKeys: String, CodingKey {
        case teamName = "team_name"
        case stats
    }
}

// MARK: - StatResponse

struct StatResponse: APIResponse {
    let name: String
    let value: String
    let shortName: String
    
    enum CodingKeys: String, CodingKey {
        case shortName = "short_name"
        case name, value
    }
}
