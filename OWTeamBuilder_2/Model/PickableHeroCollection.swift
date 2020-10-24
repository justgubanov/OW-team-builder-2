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
    
    enum Alias {
        
        case role(OWHero.Role)
        case preferenceClass(PickPreferenceClass)
    }
    
    var alias: Alias
    var pickableHeroes: [PickableHero]
    
    var id: Int {
        switch alias {
        case .role(.tank):
            return 0
        case .role(.damage):
            return 1
        case .role(.support):
            return 2
    
        case .preferenceClass(.preferred):
            return 3
        case .preferenceClass(.situational):
            return 4
        case .preferenceClass(.others):
            return 5
        }
    }
    
    init(alias: OWHero.Role, pickableHeroes: [PickableHero]) {
        self.alias = .role(alias)
        self.pickableHeroes = pickableHeroes
    }
    
    init(alias: PickPreferenceClass, pickableHeroes: [PickableHero]) {
        self.alias = .preferenceClass(alias)
        self.pickableHeroes = pickableHeroes
    }
    
    mutating func sort(by sortCriteria: SortCriteria, analyser: CompositionAnalyser? = nil) {
        switch sortCriteria {
        case .name:
            pickableHeroes = pickableHeroes.sorted { $0.hero.name < $1.hero.name }
        case .compositionValue:
            guard let analyser = analyser else {
                return
            }
            pickableHeroes = pickableHeroes.sorted { first, second in
                let valueOne = analyser.getCompositionValue(of: first.hero)
                let valueTwo = analyser.getCompositionValue(of: second.hero)
                return valueOne > valueTwo
            }
        }
    }
}
