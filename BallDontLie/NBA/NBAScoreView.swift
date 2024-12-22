//
//  NBAScoreView.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 22.12.2024.
//

import SwiftUI

struct NBAScoreUpperHeader {
    let awayTeamName: String
    let awayTeamScore: Int
    let homeTeamName: String
    let homeTeamScore: Int
    let isHomeTeamWinner: Bool
}

struct NBAPeriodScore: Identifiable {
    let period: String
    let awayTeamScore: Int
    let homeTeamScore: Int

    var id: String { period }
}

struct NBAScoreDisplayModel: Identifiable {
    let upperHeader: NBAScoreUpperHeader
    let periods: [NBAPeriodScore]
    let color: String
    
    var id: String { color }

    static let sample = NBAScoreDisplayModel(
        upperHeader: .init(
            awayTeamName: "Golden State Warriors",
            awayTeamScore: 112,
            homeTeamName: "Los Angeles Lakers",
            homeTeamScore: 111,
            isHomeTeamWinner: false
        ),
        periods: [
            NBAPeriodScore(period: "1st", awayTeamScore: 20, homeTeamScore: 21),
            NBAPeriodScore(period: "2nd", awayTeamScore: 30, homeTeamScore: 32),
            NBAPeriodScore(period: "3rd", awayTeamScore: 22, homeTeamScore: 21),
            NBAPeriodScore(period: "4th", awayTeamScore: 20, homeTeamScore: 20),
        ],
        color: "#1D428A"
    )
}

struct NBAScoreView: View {
    var data: NBAScoreDisplayModel

    private let lighterColor = Color.white.opacity(0.7)

    var body: some View {
        VStack {
            upperHeader
            Divider()
            scoresSection
        }
        .padding()
        .background(Color(hex: data.color))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    var upperHeader: some View {
        VStack {
            HStack {
                Text(data.upperHeader.awayTeamName)
                    .font(.headline)
                Spacer()
                Text(data.upperHeader.awayTeamScore, format: .number)
                    .font(.title3.weight(.medium))
            }
            .foregroundStyle(data.upperHeader.isHomeTeamWinner ? lighterColor : Color.white)

            HStack {
                Text(data.upperHeader.homeTeamName)
                    .font(.headline)
                Spacer()
                Text(data.upperHeader.homeTeamScore, format: .number)
                    .font(.title3.weight(.medium))
            }
            .foregroundStyle(data.upperHeader.isHomeTeamWinner ? Color.white : lighterColor)
        }
    }

    var scoresSection: some View {
        VStack {
            HStack {
                Spacer()
                ForEach(data.periods) { period in
                    Text(period.period)
                        .font(.subheadline)
                        .foregroundStyle(Color.white)
                        .padding(4)
                }
            }
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(data.upperHeader.awayTeamName)
                    Text(data.upperHeader.homeTeamName)
                }
                .font(.subheadline.italic())
                .foregroundStyle(Color.white)

                Spacer()
                HStack {
                    ForEach(data.periods) { period in
                        VStack {
                            Text(period.awayTeamScore, format: .number)
                                .font(.headline)
                                .foregroundStyle(period.awayTeamScore > period.homeTeamScore ? Color.white : lighterColor)
                            Text(period.homeTeamScore, format: .number)
                                .font(.headline)
                                .foregroundStyle(period.homeTeamScore > period.awayTeamScore ? Color.white : lighterColor)
                        }
                        .padding(4)
                    }
                }
            }
        }
    }
}

#Preview {
    NBAScoreView(data: NBAScoreDisplayModel.sample)
}
