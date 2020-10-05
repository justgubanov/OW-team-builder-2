//
//  HeroPicker.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct HeroPicker: View {
    
    @EnvironmentObject private var session: MatchSession
    
    var groupCriteria: HeroCollectionFabric.GroupCriteria = .pickPriority
    var sortCriteria: PickableHeroCollection.SortCriteria = .name
    
    var body: some View {
        VStack {
            ForEach(collections) { collection in
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack {
                        CollectionBadge(collectionAlias: collection.alias)
                            .padding()
                        
                        HeroPickerRow(availableHeroes: collection.pickableHeroes)
                    }
                    .padding(2)
                    .background(
                        Color(.tertiarySystemGroupedBackground)
                            .cornerRadius(10)
                    )
                    .padding(.horizontal, 16)
                }
            }
        }
    }
    
    private var collections: [PickableHeroCollection] {
        let collectionFabric = HeroCollectionFabric(session: session)
        var collections = collectionFabric.makeCollections(from: availableHeroes, groupingCriteria: groupCriteria)
        
        for index in 0..<collections.count {
            collections[index].sort(by: sortCriteria, analyser: session.compositionAnalyser)
        }
        return collections
    }
    
    private var availableHeroes: [OWHero] {
        let allHeroes = OWHeroFactory().getHeroes()
        
        guard case let .locked(role: lockedRole) = session.focusedSpot?.roleLock else {
            return allHeroes
        }
        let filteredHeroes = allHeroes.filter { hero in
            hero.role == lockedRole
        }
        return filteredHeroes
    }
}

struct HeroPicker_Previews: PreviewProvider {
    static var previews: some View {
        HeroPicker()
            .environmentObject(MatchSession())
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
