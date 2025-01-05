//
//  EuroleagueStandingsService.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 5.01.2025.
//

import Foundation

protocol EuroleagueStandingsService: APIService, EuroleagueEndpointsService {
    func getStandings() async throws -> StandingsResponse
}

extension EuroleagueStandingsService {
    func getStandings() async throws -> StandingsResponse {
        guard let endpoint = getStandingsURL() else {
            throw APIError.badURL
        }

        let response: StandingsResponse = try await handleDataTask(from: endpoint)
        return response
    }
}
