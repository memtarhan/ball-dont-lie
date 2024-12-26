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
//            datesView
//                .frame(height: 64)
//                .padding(.horizontal, 12)

            List {
                ForEach(viewModel.data) { score in
                    NBAScoreView(data: score)
                        .listRowSeparator(.hidden)
                }
            }
            .navigationTitle("Today's Scores")
            .listStyle(.plain)
            .listRowSpacing(0)
        }

        .task {
            await viewModel.fetchScores()
        }
    }

    private var datesView: some View {
        HStack {
            Button {
            } label: {
                HStack {
                    Image(systemName: "arrow.backward.circle")
                    Text("Dec 20 2024")
                }
                .font(.subheadline)
                .minimumScaleFactor(0.5)
                .foregroundStyle(Color.white)
                .padding()
                .background(Color.gray.opacity(0.7))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .frame(minWidth: 0, maxWidth: .infinity)

            Button {
            } label: {
                HStack {
                    Text("Dec 21\n2024")
                }
                .font(.subheadline)
                .minimumScaleFactor(0.5)
                .foregroundStyle(Color.white)
                .padding()
                .background(Color.gray.opacity(1.0))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .frame(minWidth: 0, maxWidth: .infinity)

            Button {
            } label: {
                HStack {
                    Text("Dec 22 2024")
                    Image(systemName: "arrow.forward.circle")
                }
                .font(.subheadline)
                .minimumScaleFactor(0.5)
                .foregroundStyle(Color.white)
                .padding()
                .background(Color.gray.opacity(0.7))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}

#Preview {
    NBAScoresView()
}