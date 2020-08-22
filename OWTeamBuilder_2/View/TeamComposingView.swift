//
//  TeamComposingView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct TeamComposingView: View {
    
    @Binding var heroes: [TeamSpot]
    
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
                ForEach(0..<heroes.count, id: \.self) { index in
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
        let heroes: [TeamSpot] = {
            var heroes: [TeamSpot] = []
            for _ in 0...5 {
                heroes.append(TeamSpot())
            }
            return heroes
        }()
        
        return TeamComposingView(heroes: .constant(heroes), title: "Your team")
            .previewLayout(.sizeThatFits)
    }
}
