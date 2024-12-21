//
//  NBAStandingsViewModel.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 20.12.2024.
//

import Foundation

@MainActor
class NBAStandingsViewModel: ObservableObject {
    @Published var data: [(StandingsHeaderData, [TeamStandingModel])?] = []

    private let service = NBAStandingsService()

    func fetchStandings() async {
        let response = try! await service.get()

        let eastHeader = StandingsHeaderData(title: "EAST", data: StandingsHeaderModel.sample)
        let eastStandingstandings = response.standings.east.enumerated().map { index, standing in
            TeamStandingModel(seat: "\(index + 1)",
                              name: standing.teamName,
                              shortName: standing.teamShortName,
                              logo: standing.teamLogo,
                              stats: standing.stats.map {
                                  TeamStatsModel(name: $0.shortName.rawValue, value: $0.value)
                              })
        }

        let westHeader = StandingsHeaderData(title: "WEST", data: StandingsHeaderModel.sample)
        let westStandingstandings = response.standings.west.enumerated().map { index, standing in
            TeamStandingModel(seat: "\(index + 1)",
                              name: standing.teamName,
                              shortName: standing.teamShortName,
                              logo: standing.teamLogo,
                              stats: standing.stats.map {
                                  TeamStatsModel(name: $0.shortName.rawValue, value: $0.value)
                              })
        }

        data = [(eastHeader, eastStandingstandings), (westHeader, westStandingstandings)]
    }
}
