//
//  HeroPickerCard.CloseButton.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 23.08.2020.
//

import SwiftUI

extension HeroPickerCard {
    
    struct GroupButton: View {
        
        @Binding var isGroupedByRole: Bool
        
        private var imageName: String {
            return isGroupedByRole ? "r.circle.fill" : "t.circle.fill"
        }
        
        var action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
            }
        }
    }
}
