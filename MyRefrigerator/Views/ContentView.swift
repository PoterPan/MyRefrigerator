//
//  ContentView.swift
//  MyRefrigerator
//
//  Created by Poter Pan on 2022/3/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            ItemView().tabItem{
                NavigationLink(destination: ItemView()) {
                    Image("refrigerator")
                    Text("Items")
                }
            }
            AddingView().tabItem{
                NavigationLink(destination: AddingView()) {
                    Image(systemName: "plus.circle.fill")
                    Text("Add")
                }
            }
            CartView().tabItem{
                NavigationLink(destination: CartView()) {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
            }
        }
//        .environmentObject(ItemViewModel())
//        .environmentObject(WishViewModel())

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
                .environmentObject(ItemViewModel())
                .environmentObject(WishViewModel())


    }
}
