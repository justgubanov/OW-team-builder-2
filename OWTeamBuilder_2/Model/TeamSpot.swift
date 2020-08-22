//
//  HeroSpot.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 26.07.2020.
//

import Foundation

class TeamSpot: Identifiable {
    
    var hero: OWHero?
    
    private(set) var id = UUID()
    
    init(hero: OWHero? = nil) {
        self.hero = hero
    }
}

extension TeamSpot: Equatable {
    
    static func == (lhs: TeamSpot, rhs: TeamSpot) -> Bool {
        return lhs.id == rhs.id
    }
}
