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

struct Standing: Codable {
    let teamName: String
    let stats: [Stat]

    enum CodingKeys: String, CodingKey {
        case teamName = "team_name"
        case stats
    }
}

// MARK: - Stat

struct Stat: Codable {
    let winsRegularSeason, lossesRegularSeason: Int?
    let winLossPctRegularSeason, gbRegularSeason, ptsPerGRegularSeason, oppPtsPerGRegularSeason: Double?

    enum CodingKeys: String, CodingKey {
        case winsRegularSeason = "wins|regular-season"
        case lossesRegularSeason = "losses|regular-season"
        case winLossPctRegularSeason = "win_loss_pct|regular-season"
        case gbRegularSeason = "gb|regular-season"
        case ptsPerGRegularSeason = "pts_per_g|regular-season"
        case oppPtsPerGRegularSeason = "opp_pts_per_g|regular-season"
    }
}
