//
//  NBATeamDetails.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 20.12.2024.
//

import SwiftUI

struct NBATeamDetails: View {
    let shortName: String
    let name: String
    let logo: String
    
    var body: some View {
        GeometryReader { _ in
            NavigationStack {
                ScrollView {
                    HStack {
                        AsyncImage(url: URL(string: logo)) { result in
                            result.image?
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 120, alignment: .center)
                        }
                        VStack {
                            Text(name)
                                .font(.title2.bold())
                            Text("Roster & Stats")
                                .font(.title3)
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.vertical, 8)
//                    .frame(width: geometry.size.width, height: 96)

                    Spacer()
                }
                .navigationTitle(shortName)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    NBATeamDetails(shortName: "HOU", name: "Houston Rockets", logo: "https://content.sportslogos.net/logos/6/230/full/6830_houston_rockets-primary-2020.png")
}
