//
//  HeroSpot.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 26.07.2020.
//

import Foundation

class TeamSpot: ObservableObject, Identifiable {
    
    enum RoleLock {
        
        case any
        case tank
        case damage
        case support
    }
    
    @Published var hero: OWHero?
    @Published var roleLock: RoleLock = .any
    
    private(set) var id = UUID()
    
    init(hero: OWHero? = nil, roleLock: RoleLock = .any) {
        self.hero = hero
    }
}

extension TeamSpot: Equatable {
    
    static func == (lhs: TeamSpot, rhs: TeamSpot) -> Bool {
        return lhs.id == rhs.id
    }
}
