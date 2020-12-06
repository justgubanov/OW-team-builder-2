//
//  CompositionChangeButton.swift
//  OverAssistantApp
//
//  Created by Александр Губанов on 24.08.2020.
//

import SwiftUI

struct CompositionChangeButton: View {
    
    @EnvironmentObject var session: MatchSession
    
    var composition: OWTeam.Composition
    
    var body: some View {
        Button(title) {
            session.resetTeams(set: composition)
        }
    }
    
    private var title: String {
        switch composition {
        case .flexibleRoles:
            return "Flexible roles"
        case .twoTwoTwo:
            return "Two-two-two"
        }
    }
}

struct CompositionChangeButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CompositionChangeButton(composition: .twoTwoTwo)
            CompositionChangeButton(composition: .flexibleRoles)
        }
        .previewLayout(.sizeThatFits)
        .environmentObject(MatchSession())
    }
}
