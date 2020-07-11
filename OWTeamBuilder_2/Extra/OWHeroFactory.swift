//
//  OWHeroFactory.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import Foundation

struct OWHeroFactory {
    
    private static let heroes: [OWHero] = [
        .init(portrait: #imageLiteral(resourceName: "heroPortrait-raehard"), name: "Raenhard", tags: .tank, idString: "raenhard"),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait-winston"), name: "Winston", tags: .tank, idString: "winston"),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait-tracer"), name: "Tracer", tags: .damagedealler, idString: "tracer"),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait-mei"), name: "Mei", tags: .damagedealler, idString: "mei"),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait-genji"), name: "Genji", tags: .damagedealler, idString: "genji"),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait-mercy"), name: "Mercy", tags: .healler, idString: "mercy"),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait-lucio"), name: "Lucio", tags: .healler, idString: "lucio")
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
