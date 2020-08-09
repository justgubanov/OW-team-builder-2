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
    
    static var teamCapacity: Int = 6
    
    @Published var focusedHeroView: SelectableHeroView?
    
    @Published var enemySpots = SpotsFactory.makeTeam(of: teamCapacity)
    @Published var allySpots = SpotsFactory.makeTeam(of: teamCapacity)
}
