//
//  Order.swift
//  CupcakeCorner
//
//  Created by Chris Wu on 5/23/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import Foundation

// day 52 - challenge 3
class ClassyOrder : ObservableObject {
    @Published var order : Order
    
    init() {
        order = Order(type: 0, quantity: 3, extraFrosting: false, extraSprinkles: false, name: "", streetAddress: "", city: "", zip: "", specialRequestEnabled: false)
    }
}

struct Order : Codable {
    enum CodingKeys : CodingKey {
        case type, quantity, extraFrosting, extraSprinkles, name, streetAddress, city, zip
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var extraFrosting = false
    var extraSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var specialRequestEnabled = false {
        didSet {
            if false == specialRequestEnabled {
                extraSprinkles = false
                extraFrosting = false
            }
        }
    }
    
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
        // day 52 - challenge 1
        if name.trimmingCharacters(in: .whitespaces).isEmpty ||
            streetAddress.trimmingCharacters(in: .whitespaces).isEmpty ||
            city.trimmingCharacters(in: .whitespaces).isEmpty ||
            zip.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        } else {
            return true
        }
    }
    
    //    func encode(to encoder: Encoder) throws {
    //        var container = encoder.container(keyedBy: CodingKeys.self)
    //
    //        try container.encode(type, forKey: .type)
    //        try container.encode(quantity, forKey: .quantity)
    //        try container.encode(extraFrosting, forKey: .extraFrosting)
    //        try container.encode(extraSprinkles, forKey: .extraSprinkles)
    //        try container.encode(name, forKey: .name)
    //        try container.encode(streetAddress, forKey: .streetAddress)
    //        try container.encode(city, forKey: .city)
    //        try container.encode(zip, forKey: .zip)
    //    }
    //
    //    init() {}
    //
    //    required init(from decoder: Decoder) throws {
    //        let container = try decoder.container(keyedBy: CodingKeys.self)
    //
    //        type = try container.decode(Int.self, forKey: .type)
    //        quantity = try container.decode(Int.self, forKey: .quantity)
    //
    //        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
    //        extraSprinkles = try container.decode(Bool.self, forKey: .extraSprinkles)
    //
    //        name = try container.decode(String.self, forKey: .name)
    //        streetAddress = try container.decode(String.self, forKey: .streetAddress)
    //        city = try container.decode(String.self, forKey: .city)
    //        zip = try container.decode(String.self, forKey: .zip)
    //    }
}
