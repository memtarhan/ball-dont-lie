//
//  ScoresView.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 13.12.2024.
//

import SwiftUI

struct ScoreRow: View {
    var score: TeamScoreModel

    var body: some View {
        HStack(alignment: .center) {
            Text("\(score.teamName)")
                .font(score.isWinner ? .body.bold() : .body)
            Spacer()
            HStack {
                Text("\(score.score)")
                    .font(.subheadline)
                Image(systemName: "basketball")
                    .font(.footnote)
            }
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .background(Color.blue.opacity(score.isWinner ? 0.3 : 0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

struct ScoresView: View {
    @StateObject var model = ScoresModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(model.scores) { score in
                    VStack(alignment: .leading) {
                        ScoreRow(score: score.firstTeam)
                        ScoreRow(score: score.secondTeam)
                    }
                }
            }
            .navigationTitle("Scores")
        }
        .task {
            await model.handleScores()
        }
    }
}

#Preview {
    ScoresView()
}
