//
//  TeamBuilderSession.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 19.07.2020.
//

import SwiftUI

private class SpotsFactory {
    
    static func makeTeam(of number: Int) -> [TeamSpot] {
        var spots: [TeamSpot] = []
        for _ in 0..<number {
            spots.append(TeamSpot())
        }
        return spots
    }
}

class MatchSession: ObservableObject {
    
    @Published var focusedSpot: Binding<TeamSpot>?
    
    @Published var enemySpots: [TeamSpot]
    @Published var allySpots: [TeamSpot]
    
    init(teamCapacity: Int) {
        enemySpots = SpotsFactory.makeTeam(of: teamCapacity)
        allySpots = SpotsFactory.makeTeam(of: teamCapacity)
    }
    
    func setHeroInFocusedSpot(to newHero: OWHero) {
        focusedSpot?.wrappedValue.hero = newHero
        moveToNextSpot()
    }
    
    private func moveToNextSpot() {
        guard let focusedSpotId = focusedSpot?.wrappedValue.id else {
            return
        }
        
        if let positionInEnemyTeam = enemySpots.firstIndex(where: { $0.id == focusedSpotId }),
           let nextSpot = getNextSpot(from: enemySpots, after: positionInEnemyTeam) {
            focusedSpot = .constant(nextSpot)
        }

        if let positionInAllyTeam = allySpots.firstIndex(where: { $0.id == focusedSpotId }),
           let nextSpot = getNextSpot(from: allySpots, after: positionInAllyTeam) {
            focusedSpot = .constant(nextSpot)
        }
    }
    
    private func getNextSpot(from spots: [TeamSpot], after position: Int) -> TeamSpot? {
        let spotAfterCurrent = spots[safeIndex: position + 1]
        guard spotAfterCurrent == nil else {
            return spotAfterCurrent
        }
        let firstSpot = spots.first
        return firstSpot
    }
}
