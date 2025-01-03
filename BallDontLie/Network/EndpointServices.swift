//
//  EndpointServices.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 21.12.2024.
//

import Foundation

//private let baseURL = "https://ball-dont-lie-c3286c3bbfc2.herokuapp.com"
 private let baseURL = "http://127.0.0.1:8000"

struct Endpoints {
    struct NBA {
        static func getStandings() -> URL? {
            URL(string: "\(baseURL)/nba/standings")
        }

        static func getScores(month: Int? = nil, day: Int? = nil, year: Int? = nil) -> URL? {
            guard let month,
                  let day,
                  let year else { return URL(string: "\(baseURL)/nba/scores") }
            return URL(string: "\(baseURL)/nba/scores?month=\(month)&day=\(day)&year=\(year)")
        }

        static func getLatestScores() -> URL? {
            URL(string: "\(baseURL)/nba/latest-scores")
        }

        static func getLatestTopPerformers() -> URL? {
            URL(string: "\(baseURL)/nba/latest-top-performers")
        }

        static func getStatLeaders() -> URL? {
            URL(string: "\(baseURL)/nba/stat-leaders")
        }
    }

    struct Leagues {
        static func getStandings() -> URL? {
            URL(string: "\(baseURL)/leagues/standings")
        }
    }

    struct Standings {
        static func get() -> URL? {
            URL(string: "\(baseURL)/euroleague/standings")
        }
    }

    struct Scores {
        static func get() -> URL? {
            URL(string: "\(baseURL)/euroleague/scores")
        }
    }
}
