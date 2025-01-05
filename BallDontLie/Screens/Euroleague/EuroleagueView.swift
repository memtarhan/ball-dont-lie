//
//  EuroleagueView.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 5.01.2025.
//

import SwiftUI

struct EuroleagueView: View {
    @StateObject private var viewModel = EuroleagueViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.loading {
                    ProgressView()
                        .progressViewStyle(.circular)

                } else {
                    contentView
                }
            }
            .navigationTitle("Euroleague")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.secondarySystemBackground)
            .task {
                await viewModel.handleData()
            }
        }
    }
    
    var contentView: some View {
        VStack {
            EuroleagueScoresView(data: viewModel.scores)
                .padding(.horizontal, 20)
            EuroleagueStandingsView(data: viewModel.standings)
        }
    }
}

#Preview {
    EuroleagueView()
}
