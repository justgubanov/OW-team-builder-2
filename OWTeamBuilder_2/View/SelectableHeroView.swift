//
//  SelectableHeroView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct SelectableHeroView: View, Identifiable {

    @Binding var heroSpot: HeroSpot
    
    @EnvironmentObject var session: MatchSession
    
    private(set) var id = UUID()
    
    private var isEmpty: Bool {
        heroSpot.hero == nil
    }
    
    private var isSelected: Bool {
        session.focusedHeroView?.heroSpot.id == heroSpot.id
    }
    
    var tap: some Gesture {
        TapGesture()
            .onEnded { _ in
                session.focusedHeroView = self
            }
    }
    
    var doubleTap: some Gesture {
        TapGesture(count: 2)
            .onEnded { _ in
                withAnimation(.easeOut) {
                    heroSpot.hero = nil
                    session.focusedHeroView = nil
                }
            }
    }
    
    var body: some View {
        ZStack {
            HeroPortraitView(heroPortrait: heroSpot.hero?.portrait,
                             isSelected: isSelected)
            
            if isEmpty {
                Text("+")
                    .bold()
                    .foregroundColor(.black)
            }
        }
        .gesture(tap)
        .simultaneousGesture(doubleTap)
    }
}

struct SelectableHeroView_Previews: PreviewProvider {
    static let mei = OWHeroFactory().makeHero(id: "mei")
    
    static var previews: some View {
        Group {
            SelectableHeroView(heroSpot: .constant(HeroSpot()))
            SelectableHeroView(heroSpot: .constant(HeroSpot(hero: mei)))
        }
        .previewLayout(.sizeThatFits)
    }
}
