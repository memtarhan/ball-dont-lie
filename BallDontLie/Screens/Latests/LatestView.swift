//
//  LatestView.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 2.01.2025.
//

import SwiftUI

struct LatestView: View {
    @StateObject private var viewModel = LatestViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.loading {
                    ProgressView()
                        .progressViewStyle(.circular)

                } else {
                    scrollView
                }
            }
            .navigationTitle("Latest")
            .background(Color.secondarySystemBackground)
            .task {
                await viewModel.fetchLatest()
            }
        }
    }

    private var scrollView: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("LATEST GAMES")
                    .font(.headline.weight(.thin))
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                LatestGamesView(data: viewModel.latestGames)
                    .padding(.vertical, 12)
            }

            VStack(alignment: .leading) {
                Text("TOP PERFORMERS")
                    .font(.headline.weight(.thin))
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                TopPerformersView(data: viewModel.topPerformers)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 4)
                    .background(Color.systemBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 20)
            }

            VStack(alignment: .leading) {
                Text("STAT LEADERS")
                    .font(.headline.weight(.thin))
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                StatLeadersView(data: viewModel.statLeaders)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 4)
                    .background(Color.systemBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    LatestView()
}
