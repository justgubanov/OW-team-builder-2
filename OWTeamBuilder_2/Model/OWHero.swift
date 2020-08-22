//
//  OWHero.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import UIKit

struct OWHero: Hashable {
    
    struct TagSet: OptionSet {
        
        let rawValue: Int
        
        static let tank = TagSet(rawValue: 1 << 0)
        static let damageDealer = TagSet(rawValue: 1 << 1)
        static let healer = TagSet(rawValue: 1 << 2)
        
        var displayableName: String {
            switch self.rawValue {
            case TagSet.tank.rawValue:
                return "Tank"
            case TagSet.damageDealer.rawValue:
                return "Damage dealler"
            case TagSet.healer.rawValue:
                return "Healler"
            default:
                return "Unknown"
            }
        }
    }
    
    var portrait: UIImage
    var name: String
    var tags: TagSet
    var idString: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(idString)
    }
}
