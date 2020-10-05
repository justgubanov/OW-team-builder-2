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
            return makeCollectionsForEachRole(pullHeroes: heroes)
        case .pickPriority:
            return makeCollectionsForPickPriority(pullHeroes: heroes)
        }
    }
    
    private func makeCollectionsForEachRole(pullHeroes: [OWHero]) -> [PickableHeroCollection] {
        let classAliases: [PickableHeroCollection.Alias] = [.role(.tank), .role(.damage), .role(.support)]
        
        return classAliases.compactMap { alias in
            guard case let .role(requiredRole) = alias else {
                return nil
            }
            let heroesOfRole = pullHeroes.filter { hero in
                hero.role == requiredRole
            }
            let selectableHeroes = mapToPickable(heroes: heroesOfRole)
            return PickableHeroCollection(alias: alias, pickableHeroes: selectableHeroes)
        }
    }
    
    private func makeCollectionsForPickPriority(pullHeroes: [OWHero]) -> [PickableHeroCollection] {
        let analyser = CompositionAnalyser(session: matchSession)
        let heroTierPriority = pullHeroes.map { hero in
            return (hero: hero, tierPriority: analyser.getCompositionValue(of: hero))
        }
        let preferenceAliases: [PickableHeroCollection.Alias] = [.preferenceClass(.preferred),
                                                                 .preferenceClass(.situational),
                                                                 .preferenceClass(.others)]
        
        return preferenceAliases.compactMap { alias in
            guard case let .preferenceClass(preference) = alias else {
                return nil
            }
            let heroes = heroTierPriority.filter { _, priorityValue in
                return preference.range.contains(priorityValue)
            }.map { $0.hero }
            
            let selectableHeroes = mapToPickable(heroes: heroes)
            guard !selectableHeroes.isEmpty else {
                return nil
            }
            return PickableHeroCollection(alias: alias, pickableHeroes: selectableHeroes)
        }
    }
    
    private func mapToPickable(heroes: [OWHero]) -> [PickableHero] {
        return heroes.map { hero in
            let isEnemySpotSelected = matchSession.focusedSpotType == .some(.enemy)
            let isAlliedSpotSelected = matchSession.focusedSpotType == .some(.allied)
            let isAlreadyInEnemyTeam = matchSession.enemySpots.contains { $0.hero == hero }
            let isAlreadyInAlliedTeam = matchSession.allySpots.contains { $0.hero == hero }
            
            if (isEnemySpotSelected && isAlreadyInEnemyTeam) || (isAlliedSpotSelected && isAlreadyInAlliedTeam) {
                return PickableHero(hero: hero, isDuplicate: false)
            } else {
                return PickableHero(hero: hero, isDuplicate: true)
            }
        }
    }
}
