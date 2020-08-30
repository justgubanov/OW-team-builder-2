//
//  TeamFactory.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 23.08.2020.
//

import Foundation

class TeamFactory {
    
    static func makeTeam(with composition: OWTeam.Composition) -> [TeamSpot] {
        switch composition {
        case .openRoles:
            return makeFreeTeam(of: 6)
        case .twoTwoTwo:
            return makeTwoTwoTwoTeam()
        }
    }
    
    private static func makeFreeTeam(of number: Int) -> [TeamSpot] {
        var spots: [TeamSpot] = []
        for _ in 0..<number {
            let newSpot = TeamSpot()
            spots.append(newSpot)
        }
        return spots
    }
    
    private static func makeTwoTwoTwoTeam() -> [TeamSpot] {
        let roleLocks: [TeamSpot.RoleLock] = [.tank, .tank, .damage, .damage, .support, .support]
        var spots: [TeamSpot] = []
        
        for lock in roleLocks {
            let newSpot = TeamSpot()
            newSpot.roleLock = lock
            spots.append(newSpot)
        }
        return spots
    }
}
