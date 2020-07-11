//
//  HeroScrollView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

protocol HeroScrollViewDelegate {
    func heroScrollViewDidSelectHero(id: String)
}

struct HeroScrollView: View {
    
    var heroes: [OWHero]
    
    var delegate: HeroScrollViewDelegate?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(alignment: .center, spacing: 14) {
                Spacer().frame(width: 8)
                ForEach(heroes, id: \.self) { hero in
                    HeroPortraitView(heroPortrait: hero.portrait)
                        .onTapGesture {
                            self.delegate?.heroScrollViewDidSelectHero(id: hero.idString)
                        }
                }
            }
        }
    }
}

struct HeroScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HeroScrollView(heroes: OWHeroFactory().getHeroes())
            .frame(width: 400, height: 100)
            .background(Color(#colorLiteral(red: 0.3411764705882353, green: 0.6235294117647059, blue: 0.16862745098039217, alpha: 1.0)))
    }
}
