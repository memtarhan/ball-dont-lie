//
//  NBAService.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 22.12.2024.
//

import Foundation

class NBAService: APIService {
    func getScores(date: Date? = nil) async throws -> ScoresResponseX {
        // TODO: Implement dates
        guard let endpoint = Endpoints.NBAScores.get() else {
            throw APIError.badURL
        }

        let response: ScoresResponseX = try await handleDataTask(from: endpoint)
        return response
    }
}
