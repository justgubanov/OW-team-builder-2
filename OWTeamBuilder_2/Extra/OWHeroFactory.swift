//
//  OWHeroFactory.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import Foundation

struct OWHeroFactory {
    
    private static let heroes: [OWHero] = [
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Raenhard"), name: "Raenhard", tags: .tank, idString: "raenhard"),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Winston"), name: "Winston", tags: .tank, idString: "winston"),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Tracer"), name: "Tracer", tags: .damageDealer, idString: "tracer"),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Mei"), name: "Mei", tags: .damageDealer, idString: "mei"),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Genji"), name: "Genji", tags: .damageDealer, idString: "genji"),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Mercy"), name: "Mercy", tags: .healer, idString: "mercy"),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Lucio"), name: "Lucio", tags: .healer, idString: "lucio")
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
