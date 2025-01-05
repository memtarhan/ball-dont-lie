//
//  Responses.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 5.01.2025.
//

import Foundation

protocol APIResponse: Decodable { }

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

struct EuroleagueScoresResponse: APIResponse {
    let title: String
    let scores: [[ScoreResponse]]
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

// MARK: - ScoresResponseX

struct ScoresResponseX: APIResponse {
    let date: Date
    let scores: [GameScoresResponse]
}

// MARK: - GameScoresResponse

struct GameScoresResponse: APIResponse {
    let teams: [ScoreResponse]
    let scores: [[Int]]
    let stats: [[String]]
    let color: String
}

// MARK: - ScoreResponse

struct ScoreResponse: APIResponse {
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
    let latestScores: [[ScoreResponse]]

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
