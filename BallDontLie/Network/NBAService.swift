//
//  NBAService.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 22.12.2024.
//

import Foundation

class NBAService: APIService {
    func getScores() async throws -> ScoresResponseX {
        guard let endpoint = Endpoints.NBAScores.get(month: 12, day: 21, year: 2024) else {
            throw APIError.badURL
        }

        let response: ScoresResponseX = try await handleDataTask(from: endpoint)
        return response
    }
}
