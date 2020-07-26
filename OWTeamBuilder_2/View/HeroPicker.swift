//
//  HeroSelectorView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct HeroPicker: View {
    
    enum GroupCriteria {
        
        case byQueueRole
        
        fileprivate var values: [OWHero.TagSet] {
            switch self {
            case .byQueueRole:
                return [.tank, .damagedealler, .healler]
            }
        }
    }
    
    private struct Collection: Hashable {
    
        var name: String
        var characters: [OWHero]
    }
        
    var heroesToSelectFrom: [OWHero]
    var groupingCriteria = GroupCriteria.byQueueRole
    
    var body: some View {
        VStack(spacing: 40) {
            ForEach(collections, id: \.self) { collection in
                VStack {
                    HStack {
                        Text(collection.name).bold()
                        Spacer()
                    }
                    
                    HeroScrollView(avaliableHeroes: collection.characters)
                }
                .padding(.horizontal, 8)
            }
        }
        .padding(.vertical, 20)
    }
    
    private var collections: [Collection] {
        var collections = [Collection]()
        for tag in groupingCriteria.values {
            let selectedHeroes = heroesToSelectFrom.filter { hero in
                hero.tags.contains(tag)
            }
            let newCollection = Collection(name: tag.displayableName, characters: selectedHeroes)
            collections.append(newCollection)
        }
        return collections
    }
}

struct HeroPicker_Previews: PreviewProvider {
    static var previews: some View {
        HeroPicker(heroesToSelectFrom: OWHeroFactory().getHeroes())
    }
}
