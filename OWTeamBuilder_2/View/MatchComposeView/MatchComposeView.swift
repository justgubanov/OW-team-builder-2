//
//  MatchComposeView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 24.08.2020.
//

import SwiftUI

struct MatchComposeView: View {
    
    @EnvironmentObject var session: MatchSession
    
    @State var showSettings: Bool = false
    
    var body: some View {
        HStack {
            ZStack {
                NavigationView {
                    Form {
                        Section {
                            TeamComposingView(heroSpots: $session.enemySpots, teamTitle: "Enemy team")
                        }
                        
                        Section {
                            TeamComposingView(heroSpots: $session.allySpots, teamTitle: "Your team")
                        }
                    }
                    .navigationTitle(Text("Match composer"))
                    .navigationBarItems(leading: SettingsButton(showSettings: $showSettings),
                                        trailing: OptionButton())
                }
                
                HeroPickerCard()
            }
        }
        
        .sheet(isPresented: $showSettings) {
            SettingsView(isPresented: $showSettings)
        }
    }
}

struct MatchComposeView_Previews: PreviewProvider {
    static var previews: some View {
        MatchComposeView()
    }
}
