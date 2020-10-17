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
        let heroId = HeroId(integerLiteral: hero.number)
        guard let specificHero = HeroProvider.getHero(id: heroId) else {
            return 0
        }
        let enemies = getEnemies()
        let allies = getAllies()
        
        let scoringBackground = ScoringBackground(allies: allies,
                                                  enemies: enemies,
                                                  conditions: GameConditions(map: nil, offenseSide: .symmetrical))
        
        let score = Scoring(of: specificHero, in: scoringBackground).result
        return Int(1000 * score.value)
    }
    
    private func getAllies() -> [Hero] {
        var heroes: [Hero]
        
        if session.focusedSpotType == .allied {
            heroes = herHeroes(from: session.allySpots)
        } else {
            heroes = herHeroes(from: session.enemySpots)
        }
        
        guard let selectedHero = session.focusedSpot?.hero,
              let heroToRemove = HeroProvider.getHero(id: HeroId(integerLiteral: selectedHero.number)),
              let removePosition = heroes.firstIndex(of: heroToRemove) else {
            return heroes
        }
        heroes.remove(at: removePosition)
        return heroes
    }
    
    private func getEnemies() -> [Hero] {
        if session.focusedSpotType == .allied {
            return herHeroes(from: session.enemySpots)
        } else {
            return herHeroes(from: session.allySpots)
        }
    }
    
    private func herHeroes(from spots: [TeamSpot]) -> [Hero] {
        return spots.compactMap { spot in
            guard let hero = spot.hero else {
                return nil
            }
            let heroId = HeroId(integerLiteral: hero.number)
            return HeroProvider.getHero(id: heroId)
        }
    }
}
