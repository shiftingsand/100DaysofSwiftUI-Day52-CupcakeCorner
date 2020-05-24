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
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Your total is \(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Place order") {
                        // do something
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Check Out", displayMode: .inline)
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
