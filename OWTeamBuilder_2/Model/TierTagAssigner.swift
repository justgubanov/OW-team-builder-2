//
//  TierTagAssigner.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 23.08.2020.
//

import Foundation

class TierTagAssigner {
    
    static private let tierOneRange = 700...1000
    static private let tierTwoRange = 400..<700
    static private let tierThreeRange = 0..<400
    
    static func assignRanks(to heroes: inout [OWHero]) {
        for index in 0..<heroes.count {
            heroes[index].tags.remove(.tierOne)
            heroes[index].tags.remove(.tierTwo)
            heroes[index].tags.remove(.tierThree)
            
            switch heroes[index].compositionValue {
            case tierOneRange:
                heroes[index].tags.insert(.tierOne)
            case tierTwoRange:
                heroes[index].tags.insert(.tierTwo)
            case tierThreeRange:
                fallthrough
            default:
                heroes[index].tags.insert(.tierThree)
            }
        }
    }
}
