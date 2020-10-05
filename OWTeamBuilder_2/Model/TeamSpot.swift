//
//  HeroSpot.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 26.07.2020.
//

import Foundation

class TeamSpot: ObservableObject, Identifiable {
    
    enum RoleLock: Equatable {
        
        case flexible
        case locked(role: OWHero.Role)
    }
    
    @Published var hero: OWHero?
    @Published var roleLock: RoleLock = .flexible
    
    private(set) var id = UUID()
    
    init(hero: OWHero? = nil, roleLock: RoleLock = .flexible) {
        self.hero = hero
    }
}

extension TeamSpot: Equatable {
    
    static func == (lhs: TeamSpot, rhs: TeamSpot) -> Bool {
        return lhs.id == rhs.id
    }
}
