//
//  MatchComposingView.SettingsButton.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 30.08.2020.
//

import SwiftUI

extension MatchComposeView {
    
    struct SettingsButton: View {
        
        @Binding var showSettings: Bool
        
        var body: some View {
            Button {
                showSettings.toggle()
            } label: {
                Image(systemName: "gear")
                    .font(.system(.body))
                    .imageScale(.large)
                    .accentColor(.orange)
            }
        }
    }
}

struct MatchComposeView_SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        MatchComposeView.SettingsButton(showSettings: .constant(true))
    }
}
