//
//  ContentView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var session = MatchSession(teamCapacity: 6)
    
    var body: some View {
        HStack {
            ZStack {
                NavigationView {
                    Form {
                        Section {
                            TeamComposingView(heroes: $session.enemySpots, title: "Enemy team")
                        }
                        
                        Section {
                            TeamComposingView(heroes: $session.allySpots, title: "Your team")
                        }
                    }
                    .navigationTitle(Text("Match composer"))
                }
                
                HeroPickerCard()
            }
        }
        .environmentObject(session)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //.preferredColorScheme(.dark)
    }
}
