//
//  HeroPicker.Collection.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 23.08.2020.
//

import Foundation

extension HeroPicker {

    struct Collection: Hashable {
        
        var name: String
        var characters: [OWHero]
    }
}
