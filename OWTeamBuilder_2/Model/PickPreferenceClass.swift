//
//  PickPreferenceClass.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 05.10.2020.
//

import Foundation

enum PickPreferenceClass {
    
    case preferred
    case situational
    case others
    
    var range: Range<Int> {
        switch self {
        case .preferred:
            return 700..<1000
        case .situational:
            return 400..<700
        case .others:
            return 0..<400
        }
    }
}
