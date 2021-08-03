//
//  ContentView.swift
//  CupcakeApp
//
//  Created by Даниил  on 03.08.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView{
            Form{
                
                Section{
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(0..<Order.types.count, id: \.self){
                            Text(Order.types[$0])
                        }
                    }
                    Stepper(value: $order.quantity, in: 3...20){
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                
                Section{
                    Toggle(isOn: $order.specialRequestEnables.animation()){
                        Text("Any special request?")
                    }
                    
                    if order.specialRequestEnables {
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        
                        Toggle(isOn: $order.addSprinkless){
                            Text("Add extra sprinkless")
                        }
                    }
                }
                
                Section{
                    NavigationLink(destination: AddressView(order: order)) {
                           Text("Delivery details")
                       }
                }
                
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
