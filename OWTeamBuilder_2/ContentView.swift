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
        MatchComposeView()
            .environmentObject(session)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //.preferredColorScheme(.dark)
    }
}
