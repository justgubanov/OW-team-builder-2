//
//  PickableHeroCollection.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 05.09.2020.
//

import SwiftUI

struct PickableHeroCollection: Identifiable {
    
    enum SortCriteria {
        
        case name
        case compositionValue
    }
    
    var name: String
    var icon: Image?
    var pickableHeroes: [PickableHero]
    var session: MatchSession
    
    let id = UUID()
    
    mutating func sort(by sortCriteria: SortCriteria) {
        switch sortCriteria {
        case .name:
            pickableHeroes = pickableHeroes.sorted { $0.hero.name < $1.hero.name }
        case .compositionValue:
            pickableHeroes = pickableHeroes.sorted { first, second in
                let analyser = CompositionAnalyser(session: session)
                let valueOne = analyser.getCompositionValue(of: first.hero)
                let valueTwo = analyser.getCompositionValue(of: second.hero)
                return valueOne > valueTwo
            }
        }
    }
}
