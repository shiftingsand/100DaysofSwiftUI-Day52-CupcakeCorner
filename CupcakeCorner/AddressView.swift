//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Chris Wu on 5/23/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order : Order
    
    var body: some View {
        Text("AddressView!")
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
