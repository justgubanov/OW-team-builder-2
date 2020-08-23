//
//  OWHeroFactory.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import Foundation

struct OWHeroFactory {
    
    private static let heroes: [OWHero] = [
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Raenhard"), name: "Raenhard", idString: "raenhard", tags: .tank),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Winston"), name: "Winston", idString: "winston", tags: .tank),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Tracer"), name: "Tracer", idString: "tracer", tags: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Mei"), name: "Mei", idString: "mei", tags: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Genji"), name: "Genji", idString: "genji", tags: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Mercy"), name: "Mercy", idString: "mercy", tags: .support),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Lucio"), name: "Lucio", idString: "lucio", tags: .support)
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
