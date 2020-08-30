//
//  SettingsView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 30.08.2020.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isAutoSwitchingEnabled") var isAutoSwitchingEnabled: Bool = true
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: header, footer: footer) {
                    Toggle("Automatically move selection", isOn: $isAutoSwitchingEnabled)
                }
            }
            .navigationTitle(Text("Settings"))
        }
    }
    
    private var header: some View {
        Text("Hero picker")
    }
    
    private var footer: some View {
        Text("Next cell will be selected automatically after you have set hero in current.")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
