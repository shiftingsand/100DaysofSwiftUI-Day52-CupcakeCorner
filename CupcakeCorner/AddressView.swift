//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Chris Wu on 5/23/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    //@ObservedObject var order : Order
    @ObservedObject var classyOrder : ClassyOrder
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $classyOrder.order.name)
                TextField("Street Address", text: $classyOrder.order.streetAddress)
                TextField("City", text: $classyOrder.order.city)
                TextField("Zip Code", text: $classyOrder.order.zip)
            }
            
            Section {
                NavigationLink("Check out", destination: CheckoutView(classyOrder: classyOrder))
            }
            .disabled(classyOrder.order.hasValidAdddress == false)
        }
        .navigationBarTitle("Delivery Details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(classyOrder: ClassyOrder())
    }
}
