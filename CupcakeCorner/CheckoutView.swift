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
    @State private var confirmationMessage = ""
    @State private var showingAlert = false
    
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
                        self.placeOrder()
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Check Out", displayMode: .inline)
            .alert(isPresented: self.$showingAlert) {
                Alert(title: Text("Thank you!"), message: Text(self.confirmationMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func placeOrder () {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "You order for \(decodedOrder.quantity) x \(Order.types[decodedOrder.type].lowercased()) cupcakes was received!"
                self.showingAlert = true
            } else {
                print("Invalid response from server")
            }
        }.resume()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
