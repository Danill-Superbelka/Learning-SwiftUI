//
//  ContentView.swift
//  Moonshot
//
//  Created by Даниил  on 27.07.2021.
//

import SwiftUI

struct ContentView: View {
    let astrounauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
        Text("\(astrounauts.count)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
