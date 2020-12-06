//
//  HeroPortrait.swift
//  OverAssistantApp
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct HeroPortrait: View {
    
    static let aspect: CGFloat = 0.8
    
    var image: UIImage?
    var overlay: AnyView = AnyView(Color.clear)
    var background: AnyView = AnyView(HeroPortraitBackground())
    
    var body: some View {
        ZStack {
            background
            if let heroPortrait = image {
                GeometryReader { geometry in
                    Image(uiImage: heroPortrait)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width)
                }
            }
            overlay
        }
        .clipShape(HeroPortraitMask())
        .aspectRatio(Self.aspect, contentMode: .fit)
    }
}

struct HeroPortraitView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeroPortrait(image: #imageLiteral(resourceName: "heroPortrait_Tracer"))
            HeroPortrait(image: nil)
        }
        .previewLayout(.sizeThatFits)
        .background(Color(#colorLiteral(red: 0.3411764705882353, green: 0.6235294117647059, blue: 0.16862745098039217, alpha: 1.0)))
    }
}
