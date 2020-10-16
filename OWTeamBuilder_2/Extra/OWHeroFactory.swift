//
//  OWHeroFactory.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import Foundation

struct OWHeroFactory {
    
    private static let heroes: [OWHero] = [
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Tracer"), name: "Tracer", number: 1, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Reaper"), name: "Reaper", number: 2, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Widowmaker"), name: "Widowmaker", number: 3, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Pharah"), name: "Pharah", number: 4, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Raenhard"), name: "Raenhard", number: 5, role: .tank),

        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Mercy"), name: "Mercy", number: 6, role: .support),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Torbjorn"), name: "Torbjörn", number: 7, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Hanzo"), name: "Hanzo", number: 8, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Winston"), name: "Winston", number: 9, role: .tank),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Zenyatta"), name: "Zenyatta", number: 10, role: .support),


        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Bastion"), name: "Bastion", number: 11, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Symmetra"), name: "Symmetra", number: 12, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Zarya"), name: "Zarya", number: 13, role: .tank),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_McCree"), name: "McCree", number: 14, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Solider76"), name: "Soldier: 76", number: 15, role: .damage),

        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Lucio"), name: "Lucio", number: 16, role: .support),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Roadhog"), name: "Roadhog", number: 17, role: .tank),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Junkrat"), name: "Junkrat", number: 18, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_DVa"), name: "D.Va", number: 19, role: .tank),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Mei"), name: "Mei", number: 20, role: .damage),

        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Genji"), name: "Genji", number: 21, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Ana"), name: "Ana", number: 22, role: .support),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Sombra"), name: "Sombra", number: 23, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Orisa"), name: "Orisa", number: 24, role: .tank),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Doomfist"), name: "Doomfist", number: 25, role: .damage),

        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Moira"), name: "Moira", number: 26, role: .support),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Brigitte"), name: "Brigitte", number: 27, role: .support),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_WreckingBall"), name: "Wrecking Ball", number: 28, role: .tank),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Ashe"), name: "Ashe", number: 29, role: .damage),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Baptiste"), name: "Baptiste", number: 30, role: .support),

        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Sigma"), name: "Sigma", number: 31, role: .tank),
        .init(portrait: #imageLiteral(resourceName: "heroPortrait_Echo"), name: "Echo", number: 32, role: .damage)
    ]
    
    func getHeroes() -> [OWHero] {
        return Self.heroes
    }
    
    func makeHero(number: Int) -> OWHero? {
        guard number >= 1, number <= Self.heroes.count else {
            return nil
        }
        let index = number - 1
        return Self.heroes[index]
    }
}
