//
//  MyRefrigeratorApp.swift
//  MyRefrigerator
//
//  Created by Poter Pan on 2022/3/26.
//

import SwiftUI

/*
 MVVM
 
 Model - data point
 View - UI
 ViewModel - Manages Models for View
 */

@main
struct MyRefrigeratorApp: App {
    
    @StateObject var itemViewModel: ItemViewModel = ItemViewModel()
    @StateObject var wishViewModel: WishViewModel = WishViewModel()

    
    var body: some Scene {
        WindowGroup {
                ContentView()
                    .environmentObject(itemViewModel)
                    .environmentObject(wishViewModel)

            
        }

    }
}

