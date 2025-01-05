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
