//
//  LatestService.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 2.01.2025.
//

import Foundation

class LatestService: APIService {
    func getLatestScores() async throws -> LatestScoresResponse {
        guard let endpoint = Endpoints.NBA.getLatestScores() else {
            throw APIError.badURL
        }

        let response: LatestScoresResponse = try await handleDataTask(from: endpoint)
        return response
    }

    func getTopPerformers() async throws -> TopPerformersResponse {
        guard let endpoint = Endpoints.NBA.getLatestTopPerformers() else {
            throw APIError.badURL
        }

        let response: TopPerformersResponse = try await handleDataTask(from: endpoint)
        return response
    }

    func getStatLeaders() async throws -> StatLeadersResponse {
        guard let endpoint = Endpoints.NBA.getStatLeaders() else {
            throw APIError.badURL
        }

        let response: StatLeadersResponse = try await handleDataTask(from: endpoint)
        return response
    }
}
