//
//  Order.swift
//  CupcakeCorner
//
//  Created by Chris Wu on 5/23/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import Foundation

class Order : ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if false == specialRequestEnabled {
                extraSprinkles = false
                extraFrosting = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var extraSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var cost : Double {
        var cost = Double(quantity * 2)
        
        cost += (Double(type) / 2)
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if extraSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    var hasValidAdddress : Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        } else {
            return true
        }
    }
}
