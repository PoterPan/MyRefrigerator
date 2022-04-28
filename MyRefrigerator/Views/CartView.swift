//
//  CartView.swift
//  MyRefrigerator
//
//  Created by Poter Pan on 2022/3/30.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var wishViewModel: WishViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                WishAddingRow()
                List {
                    ForEach(wishViewModel.items) { item in
                        WishRowView(wish: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    wishViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: wishViewModel.deleteItem)
                    .onMove(perform: wishViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("購物車")
            .navigationBarItems(
                leading: EditButton()
                )
            
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(WishViewModel())
    }
}
