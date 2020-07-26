//
//  HeroPortraitView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct HeroPortraitView: View {
    
    private let portraitAspect: CGFloat = 0.8
    
    var heroPortrait: UIImage?
    var isSelected: Bool = false
    
    var body: some View {
        ZStack {
            HeroPortraitBackground()
            
            if isSelected {
                Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))
            }
            
            if let heroPortrait = heroPortrait {
                GeometryReader { geometry in
                    Image(uiImage: heroPortrait)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width)
                }
            }
        }
        .clipShape(HeroPortraitViewMask())
        .aspectRatio(portraitAspect, contentMode: .fit)
    }
}

struct HeroPortraitView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeroPortraitView(heroPortrait: #imageLiteral(resourceName: "heroPortrait_Tracer"))
            HeroPortraitView(heroPortrait: nil)
        }
        .previewLayout(.sizeThatFits)
        .background(Color(#colorLiteral(red: 0.3411764705882353, green: 0.6235294117647059, blue: 0.16862745098039217, alpha: 1.0)))
    }
}
