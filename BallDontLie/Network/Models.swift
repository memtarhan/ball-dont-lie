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

// MARK: - Welcome

struct NBAStandingsResponse: APIResponse {
    let standings: NBAStandings
}

// MARK: - Standings

struct NBAStandings: APIResponse {
    let west, east: [NBAEast]
}

// MARK: - East

struct NBAEast: APIResponse {
    let teamName, teamShortName: String
    let teamLogo: String
    let stats: [NBAStat]

    enum CodingKeys: String, CodingKey {
        case teamName = "team_name"
        case teamShortName = "team_short_name"
        case teamLogo = "team_logo"
        case stats
    }
}

// MARK: - Stat

struct NBAStat: APIResponse {
    let name: StatName
    let value: String
    let shortName: StatShortName

    enum CodingKeys: String, CodingKey {
        case name, value
        case shortName = "short_name"
    }
}

enum StatName: String, APIResponse {
    case gb
    case losses
    case oppPtsPerG = "opp_pts_per_g"
    case ptsPerG = "pts_per_g"
    case srs
    case winLossPct = "win_loss_pct"
    case wins
}

enum StatShortName: String, APIResponse {
    case gb = "GB"
    case l = "L"
    case paG = "PA/G"
    case psG = "PS/G"
    case srs = "SRS"
    case w = "W"
    case wL = "W/L%"
}
