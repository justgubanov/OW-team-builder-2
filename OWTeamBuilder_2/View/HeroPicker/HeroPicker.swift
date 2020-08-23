//
//  HeroPicker.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct HeroPicker: View {
    
    @EnvironmentObject private var session: MatchSession
    
    private var heroesToSelectFrom: [OWHero] {
        var heroes = getAvailableHeroes()
        TierTagAssigner.assignRanks(to: &heroes)
        return heroes
    }
    
    var groupCriteria: GroupCriteria = .byTierValue
    var sortCriteria: SortCriteria = .alphabetically
    
    var body: some View {
        VStack(spacing: 40) {
            ForEach(collections, id: \.self) { collection in
                VStack {
                    HStack {
                        Text(collection.name)
                            .bold()
                        Spacer()
                    }
                    
                    HeroPickerScroll(availableHeroes: collection.characters)
                }
                .padding(.horizontal, 8)
            }
        }
        .padding(.vertical, 20)
    }
    
    private var collections: [Collection] {
        var collections = [Collection]()
        
        for tag in groupCriteria.values {
            let matchedHeroes = heroesToSelectFrom.filter { hero in
                hero.tags.contains(tag)
            }
            
            guard !matchedHeroes.isEmpty else {
                continue
            }
            let sortedHeroes = sortHeroesByCurrentCriteria(matchedHeroes)
            let newCollection = Collection(name: tag.displayableName, characters: sortedHeroes)
            collections.append(newCollection)
        }
        return collections
    }
    
    private func sortHeroesByCurrentCriteria(_ heroes: [OWHero]) -> [OWHero] {
        switch sortCriteria {
        case .alphabetically:
            return heroes.sorted { $0.name < $1.name }
        case .byCompositionValue:
            return heroes.sorted { $0.compositionValue > $1.compositionValue }
        }
    }
    
    private func getAvailableHeroes() -> [OWHero] {
        let allHeroes = OWHeroFactory().getHeroes()
        
        guard let focusedSpot = session.focusedSpot else {
            return allHeroes
        }
        let spotLock = focusedSpot.wrappedValue.roleLock
        
        let filteredHeroes = allHeroes.filter {
            $0.isAllowed(by: spotLock)
        }
        return filteredHeroes
    }
}

fileprivate extension OWHero {
    
    func isAllowed(by lock: TeamSpot.RoleLock) -> Bool {
        switch lock {
        case .any:
            return true
        case .tank:
            return tags.contains(.tank)
        case .damage:
            return tags.contains(.damage)
        case .support:
            return tags.contains(.support)
        }
    }
}

struct HeroPicker_Previews: PreviewProvider {
    static var previews: some View {
        HeroPicker()
    }
}
