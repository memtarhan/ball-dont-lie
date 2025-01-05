//
//  LatestService.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 2.01.2025.
//

import Foundation

protocol LatestService: APIService, NBAEndpointsService {
    func getLatestScores() async throws -> LatestScoresResponse
    func getTopPerformers() async throws -> TopPerformersResponse
    func getStatLeaders() async throws -> StatLeadersResponse
}

extension LatestService {
    func getLatestScores() async throws -> LatestScoresResponse {
        guard let endpoint = getLatestScoresURL() else {
            throw APIError.badURL
        }

        let response: LatestScoresResponse = try await handleDataTask(from: endpoint)
        return response
    }

    func getTopPerformers() async throws -> TopPerformersResponse {
        guard let endpoint = getLatestTopPerformersURL() else {
            throw APIError.badURL
        }

        let response: TopPerformersResponse = try await handleDataTask(from: endpoint)
        return response
    }

    func getStatLeaders() async throws -> StatLeadersResponse {
        guard let endpoint = getStatLeadersURL() else {
            throw APIError.badURL
        }

        let response: StatLeadersResponse = try await handleDataTask(from: endpoint)
        return response
    }
}
