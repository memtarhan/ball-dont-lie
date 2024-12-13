//
//  ScoresModel.swift
//  BallDontLie
//
//  Created by Mehmet Tarhan on 13.12.2024.
//

import Foundation

struct ScoreModel: Identifiable {
    let firstTeam: TeamScoreModel
    let secondTeam: TeamScoreModel
    
    var id: String { firstTeam.teamName }
}

struct TeamScoreModel: Identifiable {
    let teamName: String
    let score: String
    let isWinner: Bool

    var id: String { teamName }
}

@MainActor
class ScoresModel: ObservableObject {
    @Published var scores: [ScoreModel] = []
    
    private let service = ScoresService()
    
    func handleScores() async {
        let response = try! await service.get()
        
        let scoreModels = response.scores.map { scoreResponse in
            let firstTeam = TeamScoreModel(
                teamName: scoreResponse[0].teamName,
                score: scoreResponse[0].score,
                isWinner: scoreResponse[0].score > scoreResponse[1].score
            )
            
            let secondTeam = TeamScoreModel(
                teamName: scoreResponse[1].teamName,
                score: scoreResponse[1].score,
                isWinner: scoreResponse[1].score > scoreResponse[0].score
            )
            
            return ScoreModel(firstTeam: firstTeam, secondTeam: secondTeam)
        }
        
        self.scores = scoreModels
    }
}
