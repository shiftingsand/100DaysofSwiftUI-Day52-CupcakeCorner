//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Chris Wu on 5/24/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
