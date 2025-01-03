//
//  Service.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 13.12.2024.
//

import Foundation

protocol APIService {
    /// Handles HTTP call and retrieve a response for given url with no authorization
    /// - Parameter url: The url HTTP call should be pointed to
    /// - Returns: Returns a response of given type
    func handleDataTask<T: APIResponse>(from url: URL) async throws -> T
}

extension APIService {
    func handleDataTask<T: APIResponse>(from url: URL) async throws -> T {
        let (data, _) = try await session.data(from: url)
        data.printPrettied()
        return try decoder.decode(T.self, from: data)
    }
}

// MARK: Private variables

private extension APIService {
    var decoder: JSONDecoder {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
//        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return decoder
    }

    var session: URLSession {
        URLSession.shared
    }
}

class NBAStandingsService: APIService {
    func get() async throws -> NBAStandingsResponse {
        guard let endpoint = Endpoints.NBA.getStandings() else {
            throw APIError.badURL
        }

        let response: NBAStandingsResponse = try await handleDataTask(from: endpoint)
        return response
    }
}

class StandingsService: APIService {
    func get() async throws -> StandingsResponse {
        guard let endpoint = Endpoints.Standings.get() else {
            throw APIError.badURL
        }

        let response: StandingsResponse = try await handleDataTask(from: endpoint)
        return response
    }
}

class ScoresService: APIService {
    func get() async throws -> ScoresResponse {
        guard let endpoint = Endpoints.Scores.get() else {
            throw APIError.badURL
        }

        let response: ScoresResponse = try await handleDataTask(from: endpoint)
        return response
    }
}

extension Data {
    private var prettyJSON: NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .withoutEscapingSlashes]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }

    func printPrettied() {
        print(prettyJSON ?? "None")
    }
}
