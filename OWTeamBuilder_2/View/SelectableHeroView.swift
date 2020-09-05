//
//  SelectableHeroView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct SelectableHeroView: View, Identifiable {
    
    @Binding var heroSpot: TeamSpot
    
    @EnvironmentObject var session: MatchSession
    
    private(set) var id = UUID()
    
    private var isEmpty: Bool {
        heroSpot.hero == nil
    }
    
    private var isSelected: Bool {
        session.focusedSpot?.wrappedValue.id == heroSpot.id
    }
    
    var tap: some Gesture {
        TapGesture()
            .onEnded { _ in
                session.setFocusedSpot(to: $heroSpot)
            }
    }
    
    var doubleTap: some Gesture {
        TapGesture(count: 2)
            .onEnded { _ in
                withAnimation(.easeOut) {
                    heroSpot.hero = nil
                }
            }
    }
    
    var body: some View {
        ZStack {
            if isSelected {
                HeroPortrait(image: heroSpot.hero?.portrait,
                             background: AnyView(Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))))
            } else {
                HeroPortrait(image: heroSpot.hero?.portrait)
            }
            
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
            SelectableHeroView(heroSpot: .constant(TeamSpot()))
            SelectableHeroView(heroSpot: .constant(TeamSpot(hero: mei)))
        }
        .previewLayout(.sizeThatFits)
    }
}
