//
//  SettingsView.swift
//  OverAssistantApp
//
//  Created by Александр Губанов on 30.08.2020.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isAutoSwitchingEnabled") var isAutoSwitchingEnabled: Bool = true
    @AppStorage("isHeroDuplicationEnabled") var isHeroDuplicationEnabled: Bool = false
    
    @Binding var isPresented: Bool
    
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
            .navigationBarItems(trailing: closeButton)
        }
    }
    
    private var closeButton: some View {
        Button("Close") {
            isPresented.toggle()
        }
    }
    
    private var autoSwitchHeader: some View {
        Text("Hero picker")
    }
    
    private var autoSwitchFooter: some View {
        Text("Next cell will be selected automatically after you have set hero in current.")
    }
    private var heroDuplicationFooter: some View {
        Text("When enabled, you can add two or more copies of the hero to the team.")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isPresented: .constant(true))
    }
}
