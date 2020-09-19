//
//  HeroPicker.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct HeroPicker: View {
    
    @EnvironmentObject private var session: MatchSession
    
    var groupCriteria: HeroCollectionFabric.GroupCriteria = .tierValue
    var sortCriteria: PickableHeroCollection.SortCriteria = .name
    
    var body: some View {
        VStack(spacing: 40) {
            ForEach(collections) { collection in
                VStack {
                    HStack {
                        collection.icon
                            .imageScale(.small)
                        
                        Text(collection.name)
                            .bold()
                        Spacer()
                    }
                    
                    HeroPickerScroll(availableHeroes: collection.pickableHeroes)
                }
                .padding(.horizontal, 8)
            }
        }
        .padding(.vertical, 20)
    }
    
    private var collections: [PickableHeroCollection] {
        let collectionFabric = HeroCollectionFabric(session: session)
        var collections = collectionFabric.makeCollections(from: availableHeroes, groupingCriteria: groupCriteria)
        
        for index in 0..<collections.count {
            collections[index].sort(by: sortCriteria)
        }
        return collections
    }
    
    private var availableHeroes: [OWHero] {
        let allHeroes = OWHeroFactory().getHeroes()
        
        guard let lockedRole = session.focusedSpot?.wrappedValue.roleLock else {
            return allHeroes
        }
        let filteredHeroes = allHeroes.filter { hero in
            hero.isAllowed(by: lockedRole)
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
