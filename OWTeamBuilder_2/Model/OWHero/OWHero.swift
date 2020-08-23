//
//  OWHero.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import UIKit

struct OWHero: Hashable {
    
    var portrait: UIImage
    var name: String
    var tags: TagSet
    var idString: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(idString)
    }
}
