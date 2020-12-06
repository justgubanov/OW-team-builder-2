//
//  PickerOptionButton.swift
//  OverAssistantApp
//
//  Created by Александр Губанов on 30.09.2020.
//

import SwiftUI

struct PickerOptionButton: View {
    
    typealias Action = () -> Void
    
    var title: String
    var image: Image
    var modeName: String
    
    var action: () -> Void
    
    @State var showsMenu: Bool = false
    
    var body: some View {
        Button(action: action) {
            HStack {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading , spacing: -4) {
                    HStack {
                        Text(title)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    
                    HStack(spacing: 4) {
                        Text(modeName)
                            .bold()
                            .font(.headline)
                        
                        Image(systemName: "chevron.down")
                            .font(.callout)
                            
                    }
                    .foregroundColor(.primary)
                }
                
                
            }
            .padding()
            .frame(width: 146, height: 45)
            .background(
                Color(.tertiarySystemGroupedBackground)
                    .cornerRadius(10)
            )
        }
        
    }
}

struct PickerOptionButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PickerOptionButton(title: "Sort by", image: Image(systemName: "star.circle.fill"), modeName: "value", action: {})
            
            PickerOptionButton(title: "Sort by", image: Image(systemName: "star.circle.fill"), modeName: "pick", action: {})
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
