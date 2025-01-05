//
//  NBAStandingsService.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 5.01.2025.
//

import Foundation

protocol NNBAStandingsService: APIService, NBAEndpointsService {
    func getStandings() async throws -> NBAStandingsResponse
}

extension NNBAStandingsService {
    func getStandings() async throws -> NBAStandingsResponse {
        guard let endpoint = getStandingsURL() else {
            throw APIError.badURL
        }

        let response: NBAStandingsResponse = try await handleDataTask(from: endpoint)
        return response
    }
}
