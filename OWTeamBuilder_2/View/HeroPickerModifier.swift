//
//  PickerModifier.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 26.09.2020.
//

import SwiftUI

struct HeroPickerModifier: ViewModifier {
    
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            content
            
            if isPresented {
                HeroPickerCard(isPresented: $isPresented)
                    .frame(height: 400)
                    .background(Color(.systemGroupedBackground))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

extension View {
    
    func heroPicker(isPresented: Binding<Bool>) -> some View {
        return self.modifier(HeroPickerModifier(isPresented: isPresented))
    }
}
