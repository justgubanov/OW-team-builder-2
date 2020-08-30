//
//  MatchComposeView.OptionButton.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 30.08.2020.
//

import SwiftUI

extension MatchComposeView {
    
    struct OptionButton: View {
        
        var body: some View {
            Menu {
                Menu {
                    Text("New team composition:")
                    CompositionChangeButton(composition: .twoTwoTwo)
                    Divider()
                    CompositionChangeButton(composition: .openRoles)
                } label: {
                    HStack {
                        Text("Reset team")
                        Image(systemName: "square.and.pencil")
                    }
                }
            } label: {
                Image(systemName: "ellipsis.circle")
                    .font(.system(.body))
                    .imageScale(.large)
                    .accentColor(.orange)
            }
        }
    }
}

struct MatchComposeView_OptionButton_Previews: PreviewProvider {
    static var previews: some View {
        MatchComposeView.OptionButton()
            .environmentObject(MatchSession())
    }
}
