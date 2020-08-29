//
//  HeroPickerCell.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 23.08.2020.
//

import SwiftUI

struct HeroPickerCell: View {
    
    @EnvironmentObject private var session: MatchSession
    
    private let outlineThickness: CGFloat = 7
    
    private var containsFocusedHero: Bool {
        session.focusedSpot?.wrappedValue.hero == hero
    }
    
    var isEnabled: Bool = true
    
    var hero: OWHero
    
    var body: some View {
        ZStack {
            if containsFocusedHero {
                HeroPortraitMask()
                    .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                            style: StrokeStyle(lineWidth: outlineThickness,
                                               lineJoin: .round))
                    .padding(0.5 * outlineThickness)
                    .aspectRatio(HeroPortrait.aspect, contentMode: .fit)
            }
            
            HeroPortrait(image: hero.portrait)
                .padding(0.5 * outlineThickness)
        }
        .onTapGesture {
            guard isEnabled else {
                return
            }
            session.setHeroInFocusedSpot(to: hero)
        }
    }
}


struct HeroPickerCell_Previews: PreviewProvider {
    static var previews: some View {
        let mei = OWHeroFactory().makeHero(id: "mei")
        let session = MatchSession()
        session.focusedSpot = .constant(TeamSpot(hero: mei))
        
        return HeroPickerCell(hero: mei!)
            .environmentObject(session)
            .frame(maxHeight: 300)
            .background(Color(#colorLiteral(red: 0.3411764705882353, green: 0.6235294117647059, blue: 0.16862745098039217, alpha: 1.0)))
            .previewLayout(.sizeThatFits)
    }
}
