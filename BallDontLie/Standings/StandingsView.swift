//
//  StandingsView.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 13.12.2024.
//

import SwiftUI

struct StandingRow: View {
    var standing: StandingModel
    var width: CGFloat

    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center) {
                HStack(alignment: .center, spacing: 8) {
                    Text(standing.seat)
                        .font(.footnote)
                        .padding(8)
                        .background(Color.green.opacity(0.2))
                        .clipShape(Circle())
                    Text(standing.name)
                        .font(.body.bold())
                        .frame(width: width)
                    Spacer()
                }
                Spacer()

                HStack(alignment: .center) {
                    ForEach(standing.stats) { stat in
                        VStack {
                            Text(stat.description)
                                .font(.caption)
                                .foregroundStyle(Color(hex: stat.color))
                            Text(stat.value)
                                .font(.subheadline)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .border(Color.green.opacity(0.2), width: 0.5)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
        }
    }
}

struct StandingsView: View {
    @StateObject private var model = StandingsModel()

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                List {
                    ForEach(model.standings) { standing in
                        StandingRow(standing: standing, width: geometry.size.width / 2.5)
                    }
                }
                .navigationTitle("Standings")
            }
        }
        .task {
            await model.handleStandings()
        }
    }
}

#Preview {
    StandingsView()
}
