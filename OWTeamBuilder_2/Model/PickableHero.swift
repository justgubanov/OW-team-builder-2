//
//  PickableHero.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 05.09.2020.
//

import Foundation

struct PickableHero: Identifiable, Hashable {
    
    var hero: OWHero
    var isDuplicate: Bool
    
    var id: Int {
        return hero.number
    }
}
