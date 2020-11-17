//
//  SwiftUIViewItemDetail.swift
//  covidDine
//
//  Created by KEEVIN MITCHELL on 11/16/20.
//

import SwiftUI

struct SwiftUIViewItemDetail: View {
    //ORDER
    @EnvironmentObject var order: Order
    
    var item: MenuItem
    var body: some View {
        VStack {
            ZStack(alignment:.bottomTrailing) {
                Image(item.mainImage)
                Text("Photo:\(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            Button("Order This") {
                self.order.add(item: self.item)
            }.font(.headline)
            
            Spacer()
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct SwiftUIViewItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView {
            SwiftUIViewItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
