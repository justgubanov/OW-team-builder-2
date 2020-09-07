//
//  HeroPickerCell.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 23.08.2020.
//

import SwiftUI

struct HeroPickerCell: View {
    
    @EnvironmentObject private var session: MatchSession
    @AppStorage("isHeroDuplicationEnabled") var isHeroDuplicationEnabled: Bool = false
    
    private let outlineThickness: CGFloat = 7
    
    private var containsFocusedHero: Bool {
        session.focusedSpot?.wrappedValue.hero == hero
    }
    
    private var canBePicked: Bool {
        let isLegitimateDuplicate = isDuplicate && isHeroDuplicationEnabled
        
        guard containsFocusedHero || !isDuplicate || isLegitimateDuplicate else {
            return false
        }
        return true
    }
    
    private var overlayAlpha: Double {
        return canBePicked ? 0 : 0.8
    }
    
    var hero: OWHero
    var isDuplicate: Bool = false
    
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
            
            HeroPortrait(image: hero.portrait,
                         overlay: AnyView(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(overlayAlpha)))
                .padding(0.5 * outlineThickness)
        }
        .onTapGesture {
            guard canBePicked else {
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
        session.setFocusedSpot(to: .constant(TeamSpot(hero: mei)))
        
        return HeroPickerCell(hero: mei!, isDuplicate: false)
            .environmentObject(session)
            .frame(maxHeight: 300)
            .background(Color(#colorLiteral(red: 0.3411764705882353, green: 0.6235294117647059, blue: 0.16862745098039217, alpha: 1.0)))
            .previewLayout(.sizeThatFits)
    }
}
