//
//  TeamComposingView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct TeamComposingView: View {
    
    @State private var selectedHeroes = Array<OWHero?>(repeating: nil, count: 6)
    
    private var isTeamPopulated: Bool {
        selectedHeroes.contains { hero in
            hero != nil
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
                    SelectableHeroView(hero: $selectedHeroes[index])
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
            selectedHeroes = Array<OWHero?>(repeating: nil, count: 6)
        }
    }
}

struct TeamComposingView_Previews: PreviewProvider {
    static var previews: some View {
        TeamComposingView(title: "Your team")
            .previewLayout(.sizeThatFits)
    }
}
