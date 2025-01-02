//
//  NBAService.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 22.12.2024.
//

import Foundation

class NBAService: APIService {
    func getScores(date: Date? = nil) async throws -> ScoresResponseX {
        var url: URL?
        if let date {
            let calendar = Calendar.current
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let year = calendar.component(.year, from: date)

            url = Endpoints.NBA.getScores(month: month, day: day, year: year)

        } else {
            url = Endpoints.NBA.getScores()
        }

        guard let endpoint = url else {
            throw APIError.badURL
        }

        let response: ScoresResponseX = try await handleDataTask(from: endpoint)
        return response
    }
}
