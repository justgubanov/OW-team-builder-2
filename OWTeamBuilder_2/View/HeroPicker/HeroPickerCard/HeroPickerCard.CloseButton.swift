//
//  HeroPickerCard.CloseButton.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 23.08.2020.
//

import SwiftUI

extension HeroPickerCard {
    
    struct CloseButton: View {
        
        var close: () -> Void
        
        var body: some View {
            Button(action: close) {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .foregroundColor(.orange)
                    .frame(width: 40, height: 40)
            }
        }
        
        internal init(action: @escaping () -> Void) {
            self.close = action
        }
    }
}
