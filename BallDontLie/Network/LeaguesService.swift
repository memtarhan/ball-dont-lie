//
//  LeaguesService.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 21.12.2024.
//

import Foundation

class LeaguesService: APIService {
    func getStandings() async throws -> LeaguesResponse {
        guard let endpoint = Endpoints.Leagues.getStandings() else {
            throw APIError.badURL
        }

        let response: LeaguesResponse = try await handleDataTask(from: endpoint)
        return response
    }
}