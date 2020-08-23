//
//  OWHero.TagSet.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 23.08.2020.
//

import Foundation

extension OWHero {
    
    struct TagSet: OptionSet {
        
        let rawValue: Int
        
        static let tank = TagSet(rawValue: 1 << 0)
        static let damage = TagSet(rawValue: 1 << 1)
        static let support = TagSet(rawValue: 1 << 2)
        
        static let tierOne = TagSet(rawValue: 1 << 3)
        static let tierTwo = TagSet(rawValue: 1 << 4)
        static let tierThree = TagSet(rawValue: 1 << 5)
        
        var displayableName: String {
            switch self.rawValue {
            case TagSet.tank.rawValue:
                return "Tank"
            case TagSet.damage.rawValue:
                return "Damage"
            case TagSet.support.rawValue:
                return "Support"
            case TagSet.tierOne.rawValue:
                return "Tier I"
            case TagSet.tierTwo.rawValue:
                return "Tier II"
            case TagSet.tierThree.rawValue:
                return "Tier III"
            default:
                return "Unknown"
            }
        }
    }
}
