//
//  OWHero.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import UIKit

struct OWHero: Hashable {
    
    enum Role {
        
        case tank
        case damage
        case support
    }
    
    var portrait: UIImage
    var name: String
    var idString: String
    
    var role: Role
        
    func hash(into hasher: inout Hasher) {
        hasher.combine(idString)
    }
}
