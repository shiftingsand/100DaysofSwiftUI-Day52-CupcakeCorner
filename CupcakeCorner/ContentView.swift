//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Chris Wu on 5/23/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //@ObservedObject var order = Order()
    @ObservedObject var classyOrder = ClassyOrder()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $classyOrder.order.type) {
                        ForEach(0..<Order.types.count, id:\.self) { nummy in
                            Text("\(Order.types[nummy])")
                        }
                    }
                    
                    Stepper(value: $classyOrder.order.quantity, in: 3...20) {
                        Text("Number of cupcakes \(classyOrder.order.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $classyOrder.order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    
                    if classyOrder.order.specialRequestEnabled {
                        Toggle(isOn: $classyOrder.order.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        
                        Toggle(isOn: $classyOrder.order.extraSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink("Enter address", destination: AddressView(classyOrder: classyOrder))
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
