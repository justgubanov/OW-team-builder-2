//
//  SelectableHeroView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct SelectableHeroView: View, Identifiable {

    @State private var showModal = false
    @Binding var selectedHero: OWHero?
    
    // TODO: Remove later
    @State private var rememberedHeroIdString: String?
    
    private(set) var id = UUID()
    var avaliableHeroes: [OWHero]
    
    var body: some View {
        ZStack {            
            HeroPortraitView(heroPortrait: selectedHero?.portrait)
            
            if selectedHero == nil {
                Text("+")
                    .bold()
                    .foregroundColor(.black)
            }
        }
        
        .onTapGesture(count: 2) {
            withAnimation(.spring()) {
                selectedHero = nil
            }
        }
        
        .onTapGesture {
            rememberedHeroIdString = selectedHero?.idString
            selectedHero = nil
            showModal = true
        }
        
        .sheet(isPresented: $showModal, onDismiss: onSheetDismiss) {
            HeroSelectorView(selectedHero: $selectedHero,
                             heroes: avaliableHeroes)
        }
    }
    
    private func onSheetDismiss() {
        guard selectedHero == nil, let rememberedHeroIdString = rememberedHeroIdString else { return }
        selectedHero = OWHeroFactory().makeHero(id: rememberedHeroIdString)
    }
}

struct SelectableHeroView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SelectableHeroView(selectedHero: .constant(nil), avaliableHeroes: OWHeroFactory().getHeroes())
            
            SelectableHeroView(
                selectedHero: .constant(OWHeroFactory().makeHero(id: "mei")),
                avaliableHeroes: OWHeroFactory().getHeroes())
        }
        .previewLayout(.sizeThatFits)
    }
}
