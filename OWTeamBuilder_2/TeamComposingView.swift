//
//  TeamComposingView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct TeamComposingView: View {
    
    private var heroes = OWHeroFactory().getHeroes()
    
    var body: some View {
        VStack {
            HStack {
                Text("Select your heroes:")
                Spacer()
            }
            HStack {
                ForEach(1...6, id: \.self) { _ in
                    SelectableHeroView(avaliableHeroes: heroes, delegate: self)
                }
            }
        }
    }
}

extension TeamComposingView: SelectableHeroViewDelegate {
    
    func view(_ view: SelectableHeroView, didSetHeroTo hero: OWHero?) {
        print(String(describing: hero?.name))
    }
}

struct TeamComposingView_Previews: PreviewProvider {
    static var previews: some View {
        TeamComposingView()
    }
}
