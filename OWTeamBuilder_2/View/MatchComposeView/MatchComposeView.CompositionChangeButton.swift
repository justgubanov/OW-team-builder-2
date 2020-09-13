//
//  MatchComposeView.CompositionChangeButton.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 24.08.2020.
//

import SwiftUI

extension MatchComposeView {

    struct CompositionChangeButton: View {
        
        @EnvironmentObject var session: MatchSession
        
        var composition: OWTeam.Composition
        
        var body: some View {
            Button {
                session.resetTeams(set: composition)
            } label: {
                HStack {
                    Text(title)
                    
                    compositionImage
                }
            }
        }
        
        private var title: String {
            switch composition {
            case .openRoles:
                return "Open roles"
            case .twoTwoTwo:
                return "Two-Two-Two"
            }
        }
        
        private var compositionImage: some View {
            switch composition {
            case .openRoles:
                return Image(uiImage: UIImage())
            case .twoTwoTwo:
                return Image(systemName: "lock.shield")
            }
        }
    }
}

struct MatchComposeView_CompositionChangeButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MatchComposeView.CompositionChangeButton(composition: .twoTwoTwo)
            MatchComposeView.CompositionChangeButton(composition: .openRoles)
        }
        .previewLayout(.sizeThatFits)
        .environmentObject(MatchSession())
    }
}
