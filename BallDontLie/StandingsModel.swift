//
//  StandingsModel.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 13.12.2024.
//

import Foundation
import SwiftUI

struct StatModel: Identifiable {
    let description: String
    let value: String
    let color: Color

    var id: String {
        description
    }
}

struct StandingModel: Identifiable {
    let name: String
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
        let standingModels = response.standings.map { standing in
            var stats = [StatModel]()
            
            let wins = StatModel(description: "W", value: "\(standing.stats[0].winsRegularSeason ?? 0)", color: .green)
            stats.append(wins)
            
            let losses = StatModel(description: "L", value: "\(standing.stats[0].lossesRegularSeason ?? 0)", color: .red)
            stats.append(losses)
            
            return StandingModel(name: standing.teamName, stats: stats)
        }
        
        self.standings = standingModels
    }
}
