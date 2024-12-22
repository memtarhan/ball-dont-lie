//
//  EndpointServices.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 21.12.2024.
//

import Foundation

 private let baseURL = "https://parser-app-6e0f7eb625f7.herokuapp.com"
//private let baseURL = "http://127.0.0.1:8000"

struct Endpoints {
    struct Leagues {
        static func getStandings() -> URL? {
            URL(string: "\(baseURL)/leagues/standings")
        }
    }

    struct NBAStandings {
        static func get() -> URL? {
            URL(string: "\(baseURL)/nba/standings")
        }
    }
    
    struct NBAScores {
        static func get(month: Int, day: Int, year: Int) -> URL? {
            URL(string: "\(baseURL)/nba/scores?month=\(month)&day=\(day)&year=\(year)")
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
