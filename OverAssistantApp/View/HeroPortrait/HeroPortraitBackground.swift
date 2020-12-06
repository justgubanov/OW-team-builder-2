//
//  HeroPortraitBackground.swift
//  OverAssistantApp
//
//  Created by Александр Губанов on 12.07.2020.
//

import SwiftUI

struct HeroPortraitBackground: View {
    
    private let gradient = Gradient(
        colors: [Color(#colorLiteral(red: 0.8260970712, green: 0.8753399253, blue: 0.9298245311, alpha: 1)), Color(#colorLiteral(red: 0.8284774423, green: 0.8904280066, blue: 0.9489288926, alpha: 1)), Color(#colorLiteral(red: 0.6798356175, green: 0.8405920863, blue: 0.9413492084, alpha: 1))]
    )
    
    var body: some View {
        LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
    }
}

struct HeroPortraitBackground_Previews: PreviewProvider {
    static var previews: some View {
        HeroPortraitBackground()
            .previewLayout(.fixed(width: 150, height: 250))
    }
}
