//
//  SelectableHeroView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

protocol SelectableHeroViewDelegate {
    
    func  view(_ view: SelectableHeroView, didSetHeroTo hero: OWHero?)
}

struct SelectableHeroView: View, Identifiable {
    
    @State private var showModal = false
    @State var selectedHero: OWHero? {
        didSet {
            delegate?.view(self, didSetHeroTo: selectedHero)
        }
    }
    
    private(set) var id = UUID()
    var avaliableHeroes: [OWHero]
    var delegate: SelectableHeroViewDelegate?
    
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
            self.selectedHero = nil
            self.delegate?.view(self, didSetHeroTo: nil)
        }
        
        .onTapGesture {
            self.showModal = true
        }
        
        .sheet(isPresented: $showModal) {
            HeroSelectorView(heroes: self.avaliableHeroes, delegate: self)
        }
    }
}

extension SelectableHeroView: HeroSelectorViewDelegate {
    
    func heroSelectorViewReturnsSelectedHero(with id: String) {
        selectedHero = OWHeroFactory().makeHero(id: id)
        delegate?.view(self, didSetHeroTo: selectedHero)
    }
}

struct SelectableHeroView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SelectableHeroView(avaliableHeroes: OWHeroFactory().getHeroes())
            
            SelectableHeroView(
                selectedHero: OWHeroFactory().makeHero(id: "mei"),
                avaliableHeroes: OWHeroFactory().getHeroes())
        }
        .previewLayout(.sizeThatFits)
    }
}
