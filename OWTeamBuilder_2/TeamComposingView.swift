//
//  TeamComposingView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct TeamComposingView: View {
    
    private var heroes = OWHeroFactory().getHeroes()
    @State var selectedHeroes: [OWHero?] = [nil, nil, nil, nil, nil, nil]
    
    var body: some View {
        VStack {
            HStack {
                Text("Select your heroes:")
                Spacer()
            }
            
            HStack {
                ForEach(0...5, id: \.self) { index in
                    SelectableHeroView(selectedHero: $selectedHeroes[index], avaliableHeroes: heroes)
                }
            }
        }
    }
}

struct TeamComposingView_Previews: PreviewProvider {
    static var previews: some View {
        TeamComposingView()
    }
}
