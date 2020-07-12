//
//  HeroSelectorView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct HeroSelectorView: View {
    
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
    
    @Environment(\.presentationMode) var presentation
    @Binding var selectedHero: OWHero?
    
    var heroes: [OWHero]
    var groupingCriteria = GroupCriteria.byQueueRole
    
    var body: some View {
        VStack(spacing: 40) {
            ForEach(collections, id: \.self) { collection in
                VStack {
                    HStack {
                        Text(collection.name).bold()
                        Spacer()
                    }
                    
                    HeroScrollView(selectedHero: $selectedHero, avaliableHeroes: collection.characters)
                }
                .padding(.horizontal, 8)
            }
        }
        .padding(.vertical, 20)
        
        // TODO: Fix guard condition
        .onChange(of: $selectedHero.wrappedValue) { [selectedHero] newValue in
            guard selectedHero != nil else { return }
            presentation.wrappedValue.dismiss()
        }
    }
    
    private var collections: [Collection] {
        var collections = [Collection]()
        for tag in groupingCriteria.values {
            let selectedHeroes = heroes.filter { hero in
                hero.tags.contains(tag)
            }
            let newCollection = Collection(name: tag.displayableName, characters: selectedHeroes)
            collections.append(newCollection)
        }
        return collections
    }
}

struct HeroSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        HeroSelectorView(selectedHero: .constant(nil), heroes: OWHeroFactory().getHeroes())
    }
}
