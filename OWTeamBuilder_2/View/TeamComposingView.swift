//
//  TeamComposingView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct TeamComposingView: View {
    
    @EnvironmentObject var session: MatchSession
    
    @Binding var heroSpots: [TeamSpot]
    
    private var isTeamPopulated: Bool {
        heroSpots.contains { spot in
            spot.hero != nil
        }
    }
    
    var teamTitle: String
    
    var body: some View {
        VStack {
            HStack {
                Text(teamTitle)
                    .bold()
                Spacer()
            }
            
            HStack (spacing: -13) {
                ForEach(0..<heroSpots.count, id: \.self) { index in
                    SelectableHeroView(heroSpot: $heroSpots[index])
                }
            }
        }
        .contextMenu {
            if isTeamPopulated {
                Button(action: clearHeroes) {
                    HStack {
                        Text("Clear \(teamTitle.lowercased())")
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
    
    private func clearHeroes() {
        session.objectWillChange.send()
        for spot in heroSpots {
            spot.hero = nil
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
        
        return TeamComposingView(heroSpots: .constant(heroes), teamTitle: "Your team")
            .previewLayout(.sizeThatFits)
    }
}
