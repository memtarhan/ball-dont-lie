//
//  NBAScoresService.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 5.01.2025.
//

import Foundation

protocol NBAScoresService: APIService, NBAEndpointsService {
    func getScores(date: Date?) async throws -> ScoresResponseX
}

extension NBAScoresService {
    func getScores(date: Date? = nil) async throws -> ScoresResponseX {
        guard let endpoint = getScoresURL(date: date) else {
            throw APIError.badURL
        }

        let response: ScoresResponseX = try await handleDataTask(from: endpoint)
        return response
    }
}
