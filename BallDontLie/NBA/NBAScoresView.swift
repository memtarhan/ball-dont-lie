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
        ScrollView {
            ForEach(viewModel.data) { score in
                NBAScoreView(data: score)
                    .padding(.horizontal, 12)
            }
        }
        .task {
            await viewModel.fetchScores()
        }
    }
}

#Preview {
    NBAScoresView()
}
