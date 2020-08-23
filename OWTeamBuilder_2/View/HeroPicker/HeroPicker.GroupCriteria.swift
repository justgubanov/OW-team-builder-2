//
//  HeroPicker.GroupCriteria.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 23.08.2020.
//

import Foundation

extension HeroPicker {
    
    enum GroupCriteria {
        
        case byQueueRole
        case byTierValue
        
        var values: [OWHero.TagSet] {
            switch self {
            case .byQueueRole:
                return [.tank, .damage, .support]
            case .byTierValue:
                return [.tierOne, .tierTwo, .tierThree]
            }
        }
    }
}
