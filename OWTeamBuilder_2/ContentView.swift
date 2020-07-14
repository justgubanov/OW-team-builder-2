//
//  ContentView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            NavigationView {
                Form {
                    TeamComposingView(title: "Enemy team")
                        .padding(.all, 10)
                    
                    TeamComposingView(title: "Your team")
                        .padding(.all, 10)
                }
                .navigationTitle(Text("Team composer"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
