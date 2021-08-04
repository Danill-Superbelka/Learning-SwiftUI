//
//  Order.swift
//  CupcakeApp
//
//  Created by Даниил  on 03.08.2021.
//

import SwiftUI

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnables = false {
        didSet {
            if specialRequestEnables == false {
                extraFrosting = false
                addSprinkless = false
            }
        }
    }
    
    @Published var extraFrosting = false
    @Published var addSprinkless = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }

        return true
    }
    
    
}
