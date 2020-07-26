//
//  ContentView.swift
//  OWTeamBuilder_2
//
//  Created by Александр Губанов on 11.07.2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var session = MatchSession()
    
    var body: some View {
        HStack {
            ZStack {
                
                NavigationView {
                    Form {
                        Group {
                            TeamComposingView(title: "Enemy team")
                            TeamComposingView(title: "Your team")
                        }
                        .padding(.all, 10)
                    }
                    .navigationTitle(Text("Match composer"))
                }
                
                HeroPickerCard()
            }
        }
        .environmentObject(session)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
    }
}
