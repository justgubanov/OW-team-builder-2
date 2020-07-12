//
//  HeroPortraitBackground.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 12.07.2020.
//

import SwiftUI

struct HeroPortraitBackground: View {
    
    private let gradient = Gradient(
        colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))]
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
