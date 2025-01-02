//
//  ContentView.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 13.12.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LatestView()
                .tabItem {
                    Label("Latest", systemImage: "basketball.fill")
                }
                .tag(0)

            NBAStandingsView()
                .tabItem {
                    Label("NBA", systemImage: "basketball.fill")
                }
                .tag(1)

            NBAScoresView()
                .tabItem {
                    Label("Scores", systemImage: "basketball.circle.fill")
                }
                .tag(2)

            LeaguesView()
                .tabItem {
                    Label("Standings", systemImage: "list.bullet.circle.fill")
                }
                .tag(3)
        }
    }
}

#Preview {
    ContentView()
}
