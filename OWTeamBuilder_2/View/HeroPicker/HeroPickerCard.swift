//
//  HeroPickerCard.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 19.07.2020.
//

import SwiftUI

struct HeroPickerCard: View {
    
    @EnvironmentObject private var session: MatchSession
    
    private var isPresented: Bool {
        session.focusedSpot != nil
    }
    
    var body: some View {
        Group {
            if isPresented {
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button(action: close) {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .foregroundColor(.orange)
                                .frame(width: 40, height: 40)
                        }
                    }
                    
                    VStack {
                        HeroPicker(heroesToSelectFrom: OWHeroFactory().getHeroes())
                        
                        Spacer()
                            .frame(height: 20)
                    }
                    .frame(maxHeight: 400)
                    .background(
                        Color(.secondarySystemGroupedBackground)
                            .cornerRadius(10)
                            .shadow(radius: 30)
                    )
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
    
    private func close() {
        session.focusedSpot = nil
    }
}


struct HeroPickerCard_Previews: PreviewProvider {
    static var previews: some View {
        HeroPickerCard()
    }
}
