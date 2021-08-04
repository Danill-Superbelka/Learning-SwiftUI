//
//  Checkout.swift
//  CupcakeApp
//
//  Created by Даниил  on 04.08.2021.
//

import SwiftUI

struct Checkout: View {
    @ObservedObject var order: Order
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Checkout_Previews: PreviewProvider {
    static var previews: some View {
        Checkout(order: Order())
    }
}
