//
//  TeamBuilderSession.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 19.07.2020.
//

import SwiftUI

class MatchSession: ObservableObject {
    
    @Published var focusedHeroView: SelectableHeroView? {
        willSet {
            guard focusedHeroView?.heroSpot.id != newValue?.heroSpot.id else {
                return
            }
            focusedHeroView?.isSelected = false
        }
    }
}
