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
        
        var isRoleLockEnabled: Bool {
            return session.composition == .twoTwoTwo
        }
        
        private var toggleRoleLockTitle: String {
            return isRoleLockEnabled ? "Restart without role lock" : "Restart with role lock"
        }
        
        var body: some View {
            Button(toggleRoleLockTitle) {
                let newComposition: TeamFactory.Composition = isRoleLockEnabled ? .free : .twoTwoTwo
                session.resetTeams(set: newComposition)
            }
        }
    }
}

struct MatchComposeView_CompositionChangeButton_Previews: PreviewProvider {
    static var previews: some View {
        MatchComposeView.CompositionChangeButton()
    }
}
