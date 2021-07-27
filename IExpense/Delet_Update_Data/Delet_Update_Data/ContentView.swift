//
//  ContentView.swift
//  Delet_Update_Data
//
//  Created by Даниил  on 21.07.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        VStack{
            List{
                ForEach(numbers, id: \.self) {
                    Text("\($0)")
                }
                .onDelete(perform: removeRows)
            }
            Button("Add Number") {
                self.numbers.append(self.currentNumber)
                self.currentNumber += 1
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
