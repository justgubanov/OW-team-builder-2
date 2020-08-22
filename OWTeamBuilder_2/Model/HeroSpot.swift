//
//  HeroSpot.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 26.07.2020.
//

import Foundation

struct HeroSpot: Identifiable {
    
    var hero: OWHero?
    
    private(set) var id = UUID()
}

extension HeroSpot: Equatable {}
