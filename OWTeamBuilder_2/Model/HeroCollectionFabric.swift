//
//  PickerCollectionFabric.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 05.09.2020.
//

import Foundation

class HeroCollectionFabric {
    
    private enum PreferenceClass: CaseIterable {
        
        case preferred
        case situational
        case others
        
        var displayableName: String {
            switch self {
            case .preferred:
                return "Preferred"
            case .situational:
                return "Situational"
            case .others:
                return "Others"
            }
        }
        
        var pickPriorityRange: Range<Int> {
            switch self {
            case .preferred:
                return 700..<1000
            case .situational:
                return 400..<700
            case .others:
                return 0..<400
            }
        }
    }
    
    enum GroupCriteria {
        
        case queueRole
        case tierValue
    }
    
    var matchSession: MatchSession
    
    init(session: MatchSession) {
        matchSession = session
    }
    
    func makeCollections(from heroes: [OWHero], groupingCriteria: GroupCriteria) -> [PickableHeroCollection] {
        switch groupingCriteria {
        case .queueRole:
            return makeCollectionsForEachRole(pullHeroes: heroes)
        case .tierValue:
            return makeCollectionsForPickPriority(pullHeroes: heroes)
        }
    }
    
    private func makeCollectionsForEachRole(pullHeroes: [OWHero]) -> [PickableHeroCollection] {
        let roleTags: [OWHero.TagSet] = [.tank, .damage, .support]
        
        return roleTags.compactMap { roleTag in
            let heroesOfRole = pullHeroes.filter { $0.tags.contains(roleTag) }
            let selectableHeroes = mapToPickable(heroes: heroesOfRole)
            return PickableHeroCollection(name: roleTag.displayableName,
                                          icon: roleTag.icon,
                                          pickableHeroes: selectableHeroes,
                                          session: matchSession)
        }
    }
    
    private func makeCollectionsForPickPriority(pullHeroes: [OWHero]) -> [PickableHeroCollection] {
        let analyser = CompositionAnalyser(session: matchSession)
        let heroTierPriority = pullHeroes.map { hero in
            return (hero: hero, tierPriority: analyser.getCompositionValue(of: hero))
        }
        
        return PreferenceClass.allCases.compactMap { preferenceClass in
            let heroes = heroTierPriority.filter { _, priorityValue in
                preferenceClass.pickPriorityRange.contains(priorityValue)
            }.map { $0.hero }
            
            let selectableHeroes = mapToPickable(heroes: heroes)
            guard !selectableHeroes.isEmpty else {
                return nil
            }
            return PickableHeroCollection(name: preferenceClass.displayableName,
                                          pickableHeroes: selectableHeroes,
                                          session: matchSession)
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
