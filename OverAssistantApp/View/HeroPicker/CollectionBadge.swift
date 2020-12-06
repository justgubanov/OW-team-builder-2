//
//  CollectionBadge.swift
//  OverAssistantApp
//
//  Created by Александр Губанов on 03.10.2020.
//

import SwiftUI

struct CollectionBadge: View {
    
    var collectionAlias: PickableHeroCollection.Alias
    
    var body: some View {
        VStack {
            image
            
            Spacer()
        }
    }
    
    private var image: Image {
        switch collectionAlias {
        case .role(let someRole):
            return getImage(for: someRole)
        case .preferenceClass(let pickPreference):
            return getImage(for: pickPreference)
        }
    }
    
    private func getImage(for role: OWHero.Role) -> Image {
        switch role {
        case .tank:
            return Image("tank.fill")
        case .damage:
            return Image("damage.fill")
        case .support:
            return Image("support.fill")
        }
    }
    
    private func getImage(for pickPreference: PickPreferenceClass) -> Image {
        switch pickPreference {
        case .preferred:
            return Image(systemName: "flame.fill")
        case .situational:
            return Image(systemName: "square.fill.on.circle.fill")
        case .others:
            return Image(systemName: "square.stack.3d.up.fill")
        }
    }
}

struct CollectionBadge_Previews: PreviewProvider {
    static var previews: some View {
        CollectionBadge(collectionAlias: .role(.damage))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
