//
//  CheckoutView.swift
//  covidDine
//
//  Created by KEEVIN MITCHELL on 11/16/20.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Credit Card","CovidDine Points"] // For Picker
    static let tipAmounts = [10, 15, 20, 25, 0]
    
    
    //
    // Bind our picker to this property to know when it changes. use @state when its simple and local and make it private. body is reinvoked anytime property changes
    
    @State private var paymentType = 0 // cash selected by default. Allows us to change values in out Struct - //$paymentType 2 way binding
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    
    
    
    
    
    
    
    
    var body: some View {
        Form{
            Section {
                Picker("How do you want to pay", selection: $paymentType) {
                    ForEach(0..<Self.paymentTypes.count){
                        Text(Self.paymentTypes[$0])
                    }
                }
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add covidDine loyalty card")
                }
                
                if addLoyaltyDetails {
                    TextField("Enter your covidDine ID", text: $loyaltyNumber)
                    
                }
                
                
            }
            //New Section
            Section(header: Text("Add a tip?")) {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])")
                        
                    }
                    
                }.pickerStyle(SegmentedPickerStyle())
            }
            // New Section
            Section(header:
                Text("Total: $\(totalPrice, specifier: "%.2f")")
                        .font(.largeTitle)
            ) {
                Button("Confirm order") {
                    // show / hide Alert
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) { () -> Alert in
            let button = Alert.Button.default(Text("OK")) {
                print("OK Button Pressed")
            }
            return Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") - thank you!"), dismissButton: button)
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
