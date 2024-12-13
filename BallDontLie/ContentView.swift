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
            StandingsView()
                .tabItem {
                    Label("Standings", systemImage: "list.bullet.circle.fill")
                }
                .tag(1)
            ScoresView()
                .tabItem {
                    Label("Scores", systemImage: "basketball.circle.fill")
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
