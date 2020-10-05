//
//  SettingsButton.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 30.08.2020.
//

import SwiftUI
    
struct SettingsButton: View {
    
    @Binding var showSettings: Bool
    
    var body: some View {
        Button {
            showSettings.toggle()
        } label: {
            Image(systemName: "gear")
                .font(.system(.body))
                .imageScale(.large)
        }
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton(showSettings: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
