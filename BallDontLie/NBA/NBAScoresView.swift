//
//  NBAScoresView.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 22.12.2024.
//

import SwiftUI

struct NBAScoresView: View {
    @StateObject private var viewModel = NBAScoresViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.data) { score in
                    NBAScoreView(data: score)
                        .listRowSeparator(.hidden)
                }

                if let description = viewModel.description {
                    VStack {
                        Text(description)
                            .font(.title2.weight(.light))
                            .padding()
                        Spacer()
                    }
                }
            }
            .listStyle(.plain)
            .listRowSpacing(0)

            .navigationTitle(viewModel.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.updateWithNextDate()
                    } label: {
                        Image(systemName: "forward.frame.fill")
                    }
                }

                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        viewModel.updateWithPreviousDate()
                    } label: {
                        Image(systemName: "backward.frame.fill")
                    }
                }
            }
        }
        .refreshable {
            viewModel.refreshToDate()
        }
        .task {
            await viewModel.fetchScores()
        }
    }
}

#Preview {
    NBAScoresView()
}
