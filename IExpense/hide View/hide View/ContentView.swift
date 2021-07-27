//
//  ContentView.swift
//  hide View
//
//  Created by Даниил  on 20.07.2021.
//

import SwiftUI

struct SecondView: View {
   // var name: String
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
       // Text("Hello,\(name)")
        Button("Dissmis") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}
struct ContentView: View {
    @State private var showingSheet = false
   
    var body: some View {
        Button("ShowSheet"){
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
