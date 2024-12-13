//
//  ContentView.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 13.12.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = StandingsModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(model.standings) { standing in
                    HStack {
                        Text(standing.name)
                        Spacer()
                        ScrollView {
                            HStack {
                                ForEach(standing.stats) { stat in
                                    VStack {
                                        Text(stat.description)
                                            .font(.caption)
                                            .foregroundStyle(stat.color)
                                        Text(stat.value)
                                            .font(.headline)
                                    }
                                    .padding(6)
                                    .border(Color.green.opacity(0.2), width: 0.5)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Standings")
        }
        .task {
            await model.handleStandings()
        }
    }
}

#Preview {
    ContentView()
}
