//
//  XmarkCloseButton.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 27.09.2020.
//

import SwiftUI

struct XmarkCloseButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    private var xmarkColor: Color {
        switch colorScheme {
        case .dark:
            return Color(red: 160/255, green: 160/255, blue: 168/255)
        case .light:
            return Color(red: 130/255, green: 130/255, blue: 132/255)
        @unknown default:
            return Color(.systemGray)
        }
    }
    
    private var circleColor: Color {
        switch colorScheme {
        case .dark:
            return Color(red: 49/255, green: 49/255, blue: 53/255)
        case .light:
            return Color(red: 238/255, green: 238/255, blue: 240/255)
        @unknown default:
            return Color(.systemGray4)
        }
    }
    
    private var action: (() -> Void)?
    
    init(action: (() -> Void)? = nil) {
        self.action = action
    }
    
    var body: some View {
        Button {
            action?()
        } label: {
            ZStack {
                Circle()
                    .foregroundColor(circleColor)
                
                Image(systemName: "xmark")
                    .resizable()
                    .imageScale(.small)
                    .font(.system(size: 1, weight: .bold, design: .monospaced))
                    .foregroundColor(xmarkColor)
                    .scaleEffect(0.45)
            }
            .aspectRatio(contentMode: .fit)
        }
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            XmarkCloseButton()
            
            XmarkCloseButton()
                .preferredColorScheme(.dark)
        }
        .padding(50)
        .previewLayout(.sizeThatFits)
    }
}
