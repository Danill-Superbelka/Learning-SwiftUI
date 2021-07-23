//
//  ContentView.swift
//  Building a list we can delete from
//
//  Created by Даниил  on 22.07.2021.
//

import SwiftUI

struct ExpenseItem: Identifiable {
    let id =  UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items) {
                    item in Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
        }
        .navigationTitle("iExpense")
        .navigationBarItems(trailing:
                                Button(action: {
                                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                                    self.expenses.items.append(expense)
                                }) {
                                    Image(systemName: "plus")
                                }
        )
        .sheet(isPresented: $showingAddExpense) {
            AddView()
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
