//
//  SessionOptionsButton.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 30.08.2020.
//

import SwiftUI

struct SessionOptionsButton: View {
    
    var body: some View {
        Menu {
            Menu {
                Text("Choose composition:")
                
                CompositionChangeButton(composition: .twoTwoTwo)
                CompositionChangeButton(composition: .flexibleRoles)
            } label: {
                HStack {
                    Text("Reset both teams")
                    Image(systemName: "arrow.3.trianglepath")
                }
            }
        } label: {
            Image(systemName: "ellipsis.circle")
                .font(.system(.body))
                .imageScale(.large)
        }
    }
}

struct SessionOptionsButton_Previews: PreviewProvider {
    static var previews: some View {
        SessionOptionsButton()
            .previewLayout(.sizeThatFits)
            .environmentObject(MatchSession())
    }
}
