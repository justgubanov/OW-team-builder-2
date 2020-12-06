//
//  SelectableHeroView.swift
//  OverAssistantApp
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
        session.focusedSpot?.id == heroSpot.id
    }
    
    private var tap: some Gesture {
        TapGesture()
            .onEnded { _ in
                session.setFocusedSpot(to: heroSpot)
            }
    }
    
    private var doubleTap: some Gesture {
        TapGesture(count: 2)
            .onEnded { _ in
                withAnimation(.easeOut) {
                    heroSpot.hero = nil
                }
            }
    }
    
    private var roleImage: Image {
        switch heroSpot.roleLock {
        case .flexible:
            return Image("flex.fill")
        case .locked(role: .tank):
            return Image("tank.fill")
        case .locked(role: .damage):
            return Image("damage.fill")
        case .locked(role: .support):
            return Image("support.fill")
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
                roleImage
                    .font(.title3)
                    .foregroundColor(Color.black.opacity(0.57))
            }
        }
        .gesture(tap)
        .simultaneousGesture(doubleTap)
    }
}

struct SelectableHeroView_Previews: PreviewProvider {
    static let mei = OWHeroFactory().makeHero(number: 20)
    
    static var previews: some View {
        Group {
            SelectableHeroView(heroSpot: .constant(TeamSpot()))
            SelectableHeroView(heroSpot: .constant(TeamSpot(hero: nil, roleLock: .locked(role: .damage))))
            SelectableHeroView(heroSpot: .constant(TeamSpot(hero: mei)))
        }
        .previewLayout(.sizeThatFits)
    }
}
