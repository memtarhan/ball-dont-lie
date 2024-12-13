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
            var stats = [StatModel]()
            
            let wins = StatModel(description: "W", value: "\(standing.stats[0].winsRegularSeason ?? 0)", color: .green)
            stats.append(wins)
            
            let losses = StatModel(description: "L", value: "\(standing.stats[1].lossesRegularSeason ?? 0)", color: .red)
            stats.append(losses)
            
            let gameBehind = StatModel(description: "GB", value: "\(standing.stats[3].gbRegularSeason ?? 0)", color: .blue)
            stats.append(gameBehind)
            
            let pointsPerGame = StatModel(description: "PS/G", value: "\(standing.stats[4].ptsPerGRegularSeason ?? 0)", color: .green)
            stats.append(pointsPerGame)
            
            let pointsAgaintsPerGame = StatModel(description: "PA/G", value: "\(standing.stats[5].oppPtsPerGRegularSeason ?? 0)", color: .red)
            stats.append(pointsAgaintsPerGame)
            
            return StandingModel(name: standing.teamName, seat: "\(index + 1)", stats: stats)
        }
        
        self.standings = standingModels
    }
}
