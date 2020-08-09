//
//  TeamComposingView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct TeamComposingView: View {
    
    @Binding var heroes: [HeroSpot]
    
    private var isTeamPopulated: Bool {
        heroes.contains { spot in
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
                    SelectableHeroView(heroSpot: $heroes[index])
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
            for i in 0..<heroes.count {
                heroes[i].hero = nil
            }
        }
    }
}

struct TeamComposingView_Previews: PreviewProvider {
    static var previews: some View {
        let heroes: [HeroSpot] = {
            var heroes: [HeroSpot] = []
            for _ in 0...5 {
                heroes.append(HeroSpot())
            }
            return heroes
        }()
        
        return TeamComposingView(heroes: .constant(heroes), title: "Your team")
            .previewLayout(.sizeThatFits)
    }
}
