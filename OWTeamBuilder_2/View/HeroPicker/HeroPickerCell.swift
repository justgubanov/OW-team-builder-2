//
//  HeroPickerCell.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 23.08.2020.
//

import SwiftUI

struct HeroPickerCell: View {
    
    @EnvironmentObject private var session: MatchSession
    
    var hero: OWHero
    
    var body: some View {
        HeroPortrait(image: hero.portrait)
            .onTapGesture {
                session.setHeroInFocusedSpot(to: hero)
            }
    }
}
