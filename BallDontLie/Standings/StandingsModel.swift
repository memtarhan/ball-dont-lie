//
//  StandingsModel.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 13.12.2024.
//

import Foundation

struct StatModel: Identifiable {
    let description: String
    let value: String
    let color: String

    var id: String {
        description
    }
}

struct StandingModel: Identifiable {
    let name: String
    let seat: String
    let stats: [StatModel]

    var id: String {
        name
    }
}

@MainActor
class StandingsModel: ObservableObject {
    @Published var standings: [StandingModel] = []

    private let service = StandingsService()

    func handleStandings() async {
        let response = try! await service.get()
        let standingModels = response.standings.enumerated().map { index, standing in
            StandingModel(name: standing.teamName,
                          seat: "\(index + 1)",
                          stats: standing.stats.map { stat in
                              StatModel(description: stat.shortName,
                                        value: stat.value,
                                        color: stat.color)
                          })
        }

        standings = standingModels
    }
}
