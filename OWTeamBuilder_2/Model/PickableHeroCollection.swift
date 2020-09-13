//
//  PickableHeroCollection.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 05.09.2020.
//

import SwiftUI

struct PickableHeroCollection: Hashable {
    
    enum SortCriteria {
        
        case name
        case compositionValue
    }
    
    var name: String
    var icon: Image?
    var pickableHeroes: [PickableHero]
    
    mutating func sort(by sortCriteria: SortCriteria) {
        switch sortCriteria {
        case .name:
            pickableHeroes = pickableHeroes.sorted { $0.hero.name < $1.hero.name }
        case .compositionValue:
            pickableHeroes = pickableHeroes.sorted { $0.hero.compositionValue > $1.hero.compositionValue }
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(pickableHeroes)
    }
}
