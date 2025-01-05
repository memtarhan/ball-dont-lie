//
//  LatestGamesView.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 2.01.2025.
//

import SwiftUI

struct LatestGameRow: View {
    var data: NBAScoreUpperHeader
    var body: some View {
        VStack {
            HStack {
                Text(data.awayTeamName)
                    .font(.headline.weight(data.isHomeTeamWinner ? .light : .medium))
                Spacer()
                Text(data.awayTeamScore, format: .number)
                    .font(.title3.weight(data.isHomeTeamWinner ? .light : .medium))

            }
            
            HStack {
                Text(data.homeTeamName)
                    .font(.headline.weight(data.isHomeTeamWinner ? .medium : .light))

                Spacer()
                Text(data.homeTeamScore, format: .number)
                    .font(.title3.weight(data.isHomeTeamWinner ? .medium : .light))

            }
        }
    }
}

struct LatestGamesView: View {
    var data: [NBAScoreUpperHeader]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(data) { game in
                    LatestGameRow(data: game)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 32)
                        .background(Color.systemBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
//                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.leading, 20)


                }
            }
        }
    }
}

#Preview {
    LatestGamesView(data: NBAScoreUpperHeader.sample)
        .background(Color.primary.quaternary.opacity(0.3))
        .frame(height: 400)
}
