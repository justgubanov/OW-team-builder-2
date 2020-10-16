//
//  OWHeroFactory.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import Foundation

struct OWHeroFactory {
    
    private static let heroes: [OWHero] = [
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Raenhard"), name: "Raenhard", idString: "raenhard", number: 5, role: .tank),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Winston"), name: "Winston", idString: "winston", number: 9, role: .tank),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Tracer"), name: "Tracer", idString: "tracer", number: 1, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Mei"), name: "Mei", idString: "mei", number: 20, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Genji"), name: "Genji", idString: "genji", number: 21, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Mercy"), name: "Mercy", idString: "mercy", number: 6, role: .support),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Lucio"), name: "Lucio", idString: "lucio", number: 16, role: .support)
    ]
    
    func getHeroes() -> [OWHero] {
        return Self.heroes
    }
    
    func makeHero(id: String) -> OWHero? {
        switch id {
        case "raenhard":
            return Self.heroes[0]
        case "winston":
            return Self.heroes[1]
        case "tracer":
            return Self.heroes[2]
        case "mei":
            return Self.heroes[3]
        case "genji":
            return Self.heroes[4]
        case "mercy":
            return Self.heroes[5]
        case "lucio":
            return Self.heroes[6]
        default:
            return nil
        }
    }
}
