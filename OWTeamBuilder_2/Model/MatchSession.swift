//
//  TeamBuilderSession.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 19.07.2020.
//

import SwiftUI

class MatchSession: ObservableObject {
    
    @Published var focusedHeroView: SelectableHeroView? {
        didSet {
            guard oldValue?.id != focusedHeroView?.id else {
                return
            }
            oldValue?.isSelected = false
        }
    }
}
