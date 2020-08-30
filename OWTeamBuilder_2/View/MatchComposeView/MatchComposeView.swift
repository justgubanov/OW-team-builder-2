//
//  MatchComposeView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 24.08.2020.
//

import SwiftUI

struct MatchComposeView: View {
    
    @EnvironmentObject var session: MatchSession
    
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
                    .navigationBarItems(trailing: OptionButton())
                }
                
                HeroPickerCard()
            }
        }
    }
}

struct MatchComposeView_Previews: PreviewProvider {
    static var previews: some View {
        MatchComposeView()
    }
}
