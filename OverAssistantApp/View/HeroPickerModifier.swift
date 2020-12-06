//
//  PickerModifier.swift
//  OverAssistantApp
//
//  Created by Александр Губанов on 26.09.2020.
//

import SwiftUI

struct HeroPickerModifier: ViewModifier {
    
    @EnvironmentObject private var session: MatchSession
    
    @Binding var isPresented: Bool
    @State private var offset: CGFloat = 400
    
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            content
            
            Color(.systemGroupedBackground)
                .frame(height: 400 - offset)
        }
        .overlay(pickerCard, alignment: .bottom)
        .onChange(of: isPresented, perform: hideOrShowCard)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private var pickerCard: some View {
        HeroPickerCard(isPresented: $isPresented)
            .frame(height: 400)
            .offset(y: offset)
    }
    
    private func hideOrShowCard(wasShown _: Bool) {
        let animationTime: Double = 0.24
        
        withAnimation(.easeIn(duration: animationTime)) {
            offset = isPresented ? 0 : 400
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + animationTime) {
            if !isPresented {
                session.setFocusedSpot(to: nil)
            }
        }
    }
}

extension View {
    
    func heroPicker(isPresented: Binding<Bool>) -> some View {
        return self.modifier(HeroPickerModifier(isPresented: isPresented))
    }
}
