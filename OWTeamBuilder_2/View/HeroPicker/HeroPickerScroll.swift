//
//  HeroPickerScroll.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct HeroPickerScroll: View {
    
    var availableHeroes: [OWHero]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(alignment: .center, spacing: 14) {
                
                Spacer()
                    .frame(width: 8)
                
                ForEach(availableHeroes, id: \.self) { hero in
                    HeroPickerCell(hero: hero)
                }
            }
        }
    }
}

struct HeroScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HeroPickerScroll(availableHeroes: OWHeroFactory().getHeroes())
            .frame(maxHeight: 100)
            .background(Color(#colorLiteral(red: 0.3411764705882353, green: 0.6235294117647059, blue: 0.16862745098039217, alpha: 1.0)))
            .previewLayout(.sizeThatFits)
    }
}
