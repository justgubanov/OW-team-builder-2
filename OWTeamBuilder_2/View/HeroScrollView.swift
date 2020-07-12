//
//  HeroScrollView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct HeroScrollView: View {
    
    @Binding var selectedHero: OWHero?
    var avaliableHeroes: [OWHero]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(alignment: .center, spacing: 14) {
                
                Spacer()
                    .frame(width: 8)
                
                ForEach(avaliableHeroes, id: \.self) { hero in
                    HeroPortraitView(heroPortrait: hero.portrait)
                        .onTapGesture {
                            selectedHero = hero
                        }
                }
            }
        }
    }
}

struct HeroScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HeroScrollView(selectedHero: .constant(nil),
                       avaliableHeroes: OWHeroFactory().getHeroes())
            .frame(maxHeight: 100)
            .background(Color(#colorLiteral(red: 0.3411764705882353, green: 0.6235294117647059, blue: 0.16862745098039217, alpha: 1.0)))
            .previewLayout(.sizeThatFits)
    }
}
