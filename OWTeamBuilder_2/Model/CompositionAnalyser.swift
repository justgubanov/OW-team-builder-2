//
//  CompositionAnalyser.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 23.08.2020.
//

import Foundation

struct CompositionAnalyser {
    
    static var debugCompositionValue: [OWHero: Int] = [:]
    
    var session: MatchSession
    
    func getCompositionValue(of hero: OWHero) -> Int {
        if let storedValue = CompositionAnalyser.debugCompositionValue[hero] {
            return storedValue
        } else {
            let newValue = Int.random(in: 0..<1000)
            CompositionAnalyser.debugCompositionValue[hero] = newValue
            return newValue
        }
    }
}
