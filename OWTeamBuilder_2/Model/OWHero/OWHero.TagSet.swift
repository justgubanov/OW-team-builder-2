//
//  OWHero.TagSet.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 23.08.2020.
//

import SwiftUI

extension OWHero {
    
    struct TagSet: OptionSet {
        
        let rawValue: Int
        
        static let tank = TagSet(rawValue: 1 << 0)
        static let damage = TagSet(rawValue: 1 << 1)
        static let support = TagSet(rawValue: 1 << 2)
        
        var displayableName: String {
            switch self.rawValue {
            case TagSet.tank.rawValue:
                return "Tank"
            case TagSet.damage.rawValue:
                return "Damage"
            case TagSet.support.rawValue:
                return "Support"
            default:
                return "Unknown"
            }
        }
        
        var icon: Image? {
            switch self.rawValue {
            case TagSet.tank.rawValue:
                return Image("tank.fill")
            case TagSet.damage.rawValue:
                return Image("damage.fill")
            case TagSet.support.rawValue:
                return Image("support.fill")
            default:
                return nil
            }
        }
    }
}
