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
    
    let id = UUID()
    
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
