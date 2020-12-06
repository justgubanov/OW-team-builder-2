//
//  MatchComposeView.swift
//  OverAssistantApp
//
//  Created by Александр Губанов on 24.08.2020.
//

import SwiftUI

struct MatchComposeView: View {
    
    @EnvironmentObject var session: MatchSession
    
    @State var showSettings: Bool = false
    @State var showPicker: Bool = false
    
    private var focusedTeamIndex: Int {
        switch session.focusedSpotType {
        case .enemy:
            return 0
        case .allied:
            return 1
        case .none:
            return 2
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollViewReader { reader in
                Form {
                    Section {
                        TeamComposingView(heroSpots: $session.enemySpots, teamTitle: "Enemy team")
                    }
                    .id(0)
                    
                    Section {
                        TeamComposingView(heroSpots: $session.allySpots, teamTitle: "Your team")
                    }
                    .id(1)
                }
                .onChange(of: session.focusedSpot) { focusedSpot in
                    showPicker = focusedSpot != nil
                    withAnimation { reader.scrollTo(focusedTeamIndex) }
                }
                .onChange(of: session.focusedSpot?.hero) { _ in
                    withAnimation { reader.scrollTo(focusedTeamIndex) }
                }
            }
            .navigationTitle(Text("Match composer"))
            .navigationBarItems(leading: SettingsButton(showSettings: $showSettings),
                                trailing: SessionOptionsButton())
            
            .heroPicker(isPresented: $showPicker)
            .sheet(isPresented: $showSettings) {
                SettingsView(isPresented: $showSettings)
            }
        }
    }
}

struct MatchComposeView_Previews: PreviewProvider {
    static var previews: some View {
        MatchComposeView()
            .environmentObject(MatchSession())
    }
}
