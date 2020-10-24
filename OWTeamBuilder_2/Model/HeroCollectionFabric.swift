//
//  PickerCollectionFabric.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 05.09.2020.
//

import Foundation

class HeroCollectionFabric {
    
    enum GroupCriteria {
        
        case queueRole
        case pickPriority
    }
    
    var matchSession: MatchSession
    
    init(session: MatchSession) {
        matchSession = session
    }
    
    func makeCollections(from heroes: [OWHero], groupingCriteria: GroupCriteria) -> [PickableHeroCollection] {
        switch groupingCriteria {
        case .queueRole:
            return makeCollectionsForEachRole(heroesPull: heroes)
        case .pickPriority:
            return makeCollectionsForPickPriority(heroesPull: heroes)
        }
    }
    
    private func makeCollectionsForEachRole(heroesPull: [OWHero]) -> [PickableHeroCollection] {
        let classAliases = [OWHero.Role.tank, .damage, .support]
        
        return classAliases.map { role in
            let heroesOfRole = heroesPull.filter { hero in
                hero.role == role
            }
            let selectableHeroes = heroesOfRole.mappedToPickable(in: matchSession)
            return PickableHeroCollection(alias: role, pickableHeroes: selectableHeroes)
        }
    }
    
    private func makeCollectionsForPickPriority(heroesPull: [OWHero]) -> [PickableHeroCollection] {
        let analyser = CompositionAnalyser(session: matchSession)
        let prioritizedHeroes = heroesPull
            .map { hero in
                return (hero: hero, tierPriority: analyser.getCompositionValue(of: hero))
            }
            .sorted(by: \.tierPriority)
        
        let topThree = prioritizedHeroes.prefix(3).map { $0.hero }
        let preferredHeroes = topThree.mappedToPickable(in: matchSession)
        let preferredCollection = PickableHeroCollection(alias: .preferred, pickableHeroes: preferredHeroes)
        
        var collections: [PickableHeroCollection] = []
        collections.append(preferredCollection)
        
        let (situationalPicks, otherPicks) = prioritizedHeroes
            .suffix(from: 3)
            .map { $0 }
            .spitted(elementValue: { $0.tierPriority } )
        
        let situationalHeroes = situationalPicks
            .map { $0.hero }
            .mappedToPickable(in: matchSession)
        let otherHeroes = otherPicks
            .map { $0.hero }
            .mappedToPickable(in: matchSession)
        
        collections.append(.init(alias: .situational, pickableHeroes: situationalHeroes))
        collections.append(.init(alias: .others, pickableHeroes: otherHeroes))
        return collections
    }
}

fileprivate extension Array where Element == OWHero {
    
    func mappedToPickable(in session: MatchSession) -> [PickableHero] {
        return self.map { hero in
            let isEnemySpotSelected = session.focusedSpotType == .some(.enemy)
            let isAlliedSpotSelected = session.focusedSpotType == .some(.allied)
            let isAlreadyInEnemyTeam = session.enemySpots.contains { $0.hero == hero }
            let isAlreadyInAlliedTeam = session.allySpots.contains { $0.hero == hero }
            
            if (isEnemySpotSelected && isAlreadyInEnemyTeam) || (isAlliedSpotSelected && isAlreadyInAlliedTeam) {
                return PickableHero(hero: hero, isDuplicate: false)
            } else {
                return PickableHero(hero: hero, isDuplicate: true)
            }
        }
    }
}
