//
//  HeroSelectorView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

protocol HeroSelectorViewDelegate {
    
    func heroSelectorViewReturnsSelectedHero(with id: String)
}

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
    
    var heroes: [OWHero]
    var groupCriteria: GroupCriteria
    
    var delegate: HeroSelectorViewDelegate?
    
    init(heroes: [OWHero], groupBy criteria: GroupCriteria = .byQueueRole, delegate: HeroSelectorViewDelegate? = nil) {
        self.heroes = heroes
        self.groupCriteria = criteria
        self.delegate = delegate
    }
    
    var body: some View {
        VStack(spacing: 40) {
            ForEach(collections, id: \.self) { collection in
                VStack {
                    HStack {
                        Text(collection.name)
                            .bold()
                        Spacer()
                    }
                    HeroScrollView(heroes: collection.characters, delegate: self)
                }
                .padding(.horizontal, 8)
            }
        }
        .padding(.vertical, 20)
    }
    
    private var collections: [Collection] {
        var collections = [Collection]()
        for tag in groupCriteria.values {
            let selectedHeroes = heroes.filter { hero in
                hero.tags.contains(tag)
            }
            let newCollection = Collection(name: tag.displayableName, characters: selectedHeroes)
            collections.append(newCollection)
        }
        return collections
    }
}

extension HeroSelectorView: HeroScrollViewDelegate {
    
    func heroScrollViewDidSelectHero(id: String) {
        delegate?.heroSelectorViewReturnsSelectedHero(with: id)
        self.presentation.wrappedValue.dismiss()
    }
}

struct HeroSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        HeroSelectorView(heroes: OWHeroFactory().getHeroes())
    }
}
