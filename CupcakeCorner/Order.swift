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
}
