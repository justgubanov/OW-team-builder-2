//
//  CompositionAnalyser.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 23.08.2020.
//

import OverAssistant
import SwiftyJSON
import Foundation

struct CompositionAnalyser {
    
    var session: MatchSession
    
    func getCompositionValue(of hero: OWHero) -> Int {
        guard let specificHero = HeroList[heroNumber: hero.number] else {
            return 0
        }
        
        let enemies: [Hero] = session.enemySpots.compactMap { spot in
            guard let hero = spot.hero else {
                return nil
            }
            return HeroList[heroNumber: hero.number]
        }

        let allies: [Hero] = session.allySpots.compactMap { spot in
            guard let hero = spot.hero else {
                return nil
            }
            return HeroList[heroNumber: hero.number]
        }
        
        let scoringBackground = ScoringBackground(allies: allies,
                                                  enemies: enemies,
                                                  conditions: GameConditions(map: nil, offenseSide: .symmetrical))
        
        let score = Scoring(of: specificHero, in: scoringBackground).result
        return Int(1000 * score.value)
    }
}
