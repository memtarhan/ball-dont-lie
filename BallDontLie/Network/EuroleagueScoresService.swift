//
//  EuroleagueScoresService.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 5.01.2025.
//

import Foundation

protocol EuroleagueScoresService: APIService, EuroleagueEndpointsService {
    func getScores() async throws -> ScoresResponse
}

extension EuroleagueScoresService {
    func getScores() async throws -> ScoresResponse {
        guard let endpoint = getScoresURL() else {
            throw APIError.badURL
        }

        let response: ScoresResponse = try await handleDataTask(from: endpoint)
        return response
    }
}
