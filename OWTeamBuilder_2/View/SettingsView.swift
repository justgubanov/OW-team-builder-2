//
//  SettingsView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 30.08.2020.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isAutoSwitchingEnabled") var isAutoSwitchingEnabled: Bool = true
    @AppStorage("isHeroDuplicationEnabled") var isHeroDuplicationEnabled: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: autoSwitchHeader, footer: autoSwitchFooter) {
                    Toggle("Automatically move selection", isOn: $isAutoSwitchingEnabled)
                }
                
                Section(footer: heroDuplicationFooter) {
                    Toggle("Allow hero duplication", isOn: $isHeroDuplicationEnabled)
                }
            }
            .navigationTitle(Text("Settings"))
        }
    }
    
    private var autoSwitchHeader: some View {
        Text("Hero picker")
    }
    
    private var autoSwitchFooter: some View {
        Text("Next cell will be selected automatically after you have set hero in current.")
    }
    private var heroDuplicationFooter: some View {
        Text("When enabled, team can have any number of same hero")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
