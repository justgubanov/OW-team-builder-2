//
//  HeroPortraitMask.swift
//  OverAssistantApp
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct HeroPortraitMask: Shape {
    
    private var shiftPercentage: CGFloat = 0.21
    
    func path(in rect: CGRect) -> Path {
        let topLeftCorner = CGPoint(x: rect.maxX * shiftPercentage, y: rect.minY)
        let topRightCorner = CGPoint(x: rect.maxX, y: rect.minY)
        let bottomLeftCorner = CGPoint(x: rect.minX, y: rect.maxY)
        let bottomRightCorner = CGPoint(x: rect.maxX * (1 - shiftPercentage), y: rect.maxY)
        
        var path = Path()
        path.move(to: topLeftCorner)
        path.addLines([
            topRightCorner,
            bottomRightCorner,
            bottomLeftCorner,
            topLeftCorner
        ])
        path.closeSubpath()
        return path
    }
}

struct HeroPortraitViewMask_Previews: PreviewProvider {
    static var previews: some View {
        HeroPortraitMask()
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
