//
//  HeroPortraitViewMask.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct HeroPortraitViewMask: Shape {
    
    private var shiftPersentage: CGFloat = 0.21
    
    func path(in rect: CGRect) -> Path {
        let topLeftCorner = CGPoint(x: rect.maxX * shiftPersentage, y: rect.minY)
        let topRightCorner = CGPoint(x: rect.maxX, y: rect.minY)
        let bottomLeftCorner = CGPoint(x: rect.minX, y: rect.maxY)
        let bottomRightCorner = CGPoint(x: rect.maxX * (1 - shiftPersentage), y: rect.maxY)
        
        var path = Path()
        path.move(to: topLeftCorner)
        path.addLines([
            topRightCorner,
            bottomRightCorner,
            bottomLeftCorner,
            topLeftCorner
        ])
        return path
    }
}

struct HeroPortraitViewMask_Previews: PreviewProvider {
    static var previews: some View {
        HeroPortraitViewMask()
    }
}
