//
//  TeamComposingView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct TeamComposingView: View {
    
    @State private var selectedHeroes: [HeroSpot] = {
        var newSpots: [HeroSpot] = []
        for _ in 0...5 {
            newSpots.append(HeroSpot())
        }
        return newSpots
    }()
    
    private var isTeamPopulated: Bool {
        selectedHeroes.contains { spot in
            spot.hero != nil
        }
    }
    
    var title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .bold()
                Spacer()
            }
            
            HStack (spacing: -13) {
                ForEach(0...5, id: \.self) { index in
                    SelectableHeroView(heroSpot: $selectedHeroes[index])
                }
            }
        }
        .contextMenu {
            if isTeamPopulated {
                Button(action: clearHeroes) {
                    HStack {
                        Text("Clear")
                        Image(systemName: "trash.fill")
                    }
                }
            }
        }
    }
    
    private func clearHeroes() {
        withAnimation(.spring()) {
            for i in 0..<selectedHeroes.count {
                selectedHeroes[i].hero = nil
            }
        }
    }
}

struct TeamComposingView_Previews: PreviewProvider {
    static var previews: some View {
        TeamComposingView(title: "Your team")
            .previewLayout(.sizeThatFits)
    }
}
