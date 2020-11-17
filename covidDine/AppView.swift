//
//  AppView.swift
//  covidDine
//
//  Created by KEEVIN MITCHELL on 11/16/20.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            //Tab1
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
            //Tab2
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
