//
//  EuroleagueScoresService.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 5.01.2025.
//

import Foundation

protocol EuroleagueScoresService: APIService, EuroleagueEndpointsService {
    func getScores() async throws -> EuroleagueScoresResponse
}

extension EuroleagueScoresService {
    func getScores() async throws -> EuroleagueScoresResponse {
        guard let endpoint = getScoresURL() else {
            throw APIError.badURL
        }

        let response: EuroleagueScoresResponse = try await handleDataTask(from: endpoint)
        return response
    }
}
