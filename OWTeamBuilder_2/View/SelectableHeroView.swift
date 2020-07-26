//
//  SelectableHeroView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct SelectableHeroView: View, Identifiable {

    @Binding var hero: OWHero?
    
    @EnvironmentObject var session: MatchSession
    
    private(set) var id = UUID()
    
    private var hasHero: Bool {
        hero != nil
    }
    
    @State var isSelected: Bool = false
    
    var body: some View {
        ZStack {
            HeroPortraitView(heroPortrait: hero?.portrait, isSelected: isSelected)
            
            if !hasHero {
                Text("+")
                    .bold()
                    .foregroundColor(.black)
            }
        }
        .onTapGesture(count: 2) {
            withAnimation(.easeOut) {
                hero = nil
            }
            session.focusedHeroView = nil
        }
        .onTapGesture {
            isSelected = true
            session.focusedHeroView = self
        }
    }
}

struct SelectableHeroView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SelectableHeroView(hero: .constant(nil))
            SelectableHeroView(hero: .constant(OWHeroFactory().makeHero(id: "mei")))
        }
        .previewLayout(.sizeThatFits)
    }
}
