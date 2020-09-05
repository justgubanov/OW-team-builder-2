//
//  TeamBuilderSession.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 19.07.2020.
//

import SwiftUI

class MatchSession: ObservableObject {
    
    enum FocusedSpotType {
        case allied
        case enemy
    }
    
    @AppStorage("isAutoSwitchingEnabled") var isAutoSwitchingEnabled: Bool = true
    
    @Published private(set) var focusedSpot: Binding<TeamSpot>?
    @Published private(set) var focusedSpotType: FocusedSpotType?
    
    @Published var enemySpots: [TeamSpot]
    @Published var allySpots: [TeamSpot]
    
    private(set) var composition: OWTeam.Composition = .twoTwoTwo
    
    init() {
        enemySpots = TeamFactory.makeTeam(with: composition)
        allySpots = TeamFactory.makeTeam(with: composition)
    }
    
    func setFocusedSpot(to newSpot: Binding<TeamSpot>?) {
        focusedSpot = newSpot
        switch newSpot {
        case let enemySpot where enemySpots.contains { $0.id == enemySpot?.wrappedValue.id }:
            focusedSpotType = .enemy
        case let allySpot where allySpots.contains { $0.id == allySpot?.wrappedValue.id }:
            focusedSpotType = .allied
        default:
            focusedSpotType = .none
        }
    }
    
    func setHeroInFocusedSpot(to newHero: OWHero) {
        focusedSpot?.wrappedValue.hero = newHero
        
        guard isAutoSwitchingEnabled else {
            objectWillChange.send()
            return
        }
        moveToNextSpot()
    }
    
    func resetTeams(set newComposition: OWTeam.Composition? = nil) {
        if let newComposition = newComposition {
            composition = newComposition
        }
        focusedSpot = nil
        
        enemySpots = TeamFactory.makeTeam(with: composition)
        allySpots = TeamFactory.makeTeam(with: composition)
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
