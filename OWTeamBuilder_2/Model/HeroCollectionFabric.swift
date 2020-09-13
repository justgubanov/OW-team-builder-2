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
        case tierValue
        
        fileprivate var values: [OWHero.TagSet] {
            switch self {
            case .queueRole:
                return [.tank, .damage, .support]
            case .tierValue:
                return [.tierOne, .tierTwo, .tierThree]
            }
        }
    }
    
    var matchSession: MatchSession
    
    init(session: MatchSession) {
        matchSession = session
    }
    
    func makeCollections(from heroes: [OWHero], groupingCriteria: GroupCriteria) -> [PickableHeroCollection] {
        var collections = [PickableHeroCollection]()
        
        for tagSet in groupingCriteria.values {
            if let namedCollection = createCollection(selectingHeroesFrom: heroes, allowedHeroTags: tagSet) {
                collections.append(namedCollection)
            }
        }
        return collections
    }
    
    private func createCollection(selectingHeroesFrom heroes: [OWHero], allowedHeroTags: OWHero.TagSet) -> PickableHeroCollection? {
        let matchedHeroes = heroes.filter { hero in
            hero.tags.contains(allowedHeroTags)
        }
        
        let selectableHeroes: [PickableHero] = matchedHeroes.map { hero in
            var isDuplicate = true
            
            if matchSession.focusedSpotType == .some(.allied)
                && matchSession.allySpots.contains(where: { $0.hero == hero }) {
                isDuplicate = false
            }
            
            if matchSession.focusedSpotType == .some(.enemy)
                && matchSession.enemySpots.contains(where: { $0.hero == hero }) {
                isDuplicate = false
            }
            
            return PickableHero(hero: hero, isDuplicate: isDuplicate)
        }
        
        guard !selectableHeroes.isEmpty else {
            return nil
        }
        return PickableHeroCollection(name: allowedHeroTags.displayableName,
                                      icon: allowedHeroTags.icon,
                                      pickableHeroes: selectableHeroes)
    }
}
