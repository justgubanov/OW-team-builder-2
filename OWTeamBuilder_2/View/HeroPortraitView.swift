//
//  HeroPortraitView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct HeroPortraitView: View {
    
    var heroPortrait: UIImage
    
    var body: some View {
        ZStack() {
            GeometryReader { geometry in
                Image(uiImage: self.heroPortrait)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width)
            }
        }
        .clipShape(HeroPortraitViewMask())
        .clipped()
        .aspectRatio(4/4, contentMode: .fit)
    }
}

struct HeroPortraitView_Previews: PreviewProvider {
    static var previews: some View {
        HeroPortraitView(heroPortrait: #imageLiteral(resourceName: "heroPortrait-tracer"))
            .frame(width: 400, height: 200)
            .background(Color(#colorLiteral(red: 0.3411764705882353, green: 0.6235294117647059, blue: 0.16862745098039217, alpha: 1.0)))
    }
}
