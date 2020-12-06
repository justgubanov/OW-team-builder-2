//
//  HeroPickerRow.swift
//  OverAssistantApp
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct HeroPickerRow: View {
    
    var availableHeroes: [PickableHero]
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(availableHeroes) {
                HeroPickerCell(hero: $0.hero, isDuplicate: !$0.isDuplicate)
            }
        }
    }
}

struct HeroScrollView_Previews: PreviewProvider {
    static var previews: some View {
        let heroes = OWHeroFactory().getHeroes()
        let pickableHeroes = heroes.map {
            PickableHero(hero: $0, isDuplicate: true)
        }
        
        return HeroPickerRow(availableHeroes: pickableHeroes)
            .frame(maxHeight: 100)
            .background(Color(#colorLiteral(red: 0.3411764705882353, green: 0.6235294117647059, blue: 0.16862745098039217, alpha: 1.0)))
            .previewLayout(.sizeThatFits)
    }
}
