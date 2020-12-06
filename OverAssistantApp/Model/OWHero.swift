//
//  OWHero.swift
//  OverAssistantApp
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
    
    let portrait: UIImage
    let name: String
    
    let number: Int
    
    let role: Role
        
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
