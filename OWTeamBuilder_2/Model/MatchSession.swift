//
//  TeamBuilderSession.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 19.07.2020.
//

import SwiftUI

private class SpotsFactory {
    
    static func makeTeam(of number: Int) -> [HeroSpot] {
        var spots: [HeroSpot] = []
        for _ in 0...number {
            spots.append(HeroSpot())
        }
        return spots
    }
}

class MatchSession: ObservableObject {
    
    @Published var focusedSpot: Binding<HeroSpot>?
    
    @Published var enemySpots: [HeroSpot]
    @Published var allySpots: [HeroSpot]
    
    init(teamCapacity: Int = 6) {
        enemySpots = SpotsFactory.makeTeam(of: teamCapacity)
        allySpots = SpotsFactory.makeTeam(of: teamCapacity)
    }
    
    func changeFocusedHero(to newHero: OWHero) {
        focusedSpot?.wrappedValue.hero = newHero
    }
}
