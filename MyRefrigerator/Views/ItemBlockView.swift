//
//  ItemBlockView.swift
//  MyRefrigerator
//
//  Created by Poter Pan on 2022/4/9.
//

import SwiftUI

struct ItemBlockView: View {
    
    @EnvironmentObject var itemViewModel: ItemViewModel
    let item: ItemModel
    
    var body: some View {
        VStack {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            
            Text(item.name)
                .font(.headline)
            
            Group {
                Text("有效期限")
                Text(item.exp.formatted(date: .numeric, time: .omitted))
            }
            .font(.footnote)

        }
    }
}

struct ItemBlockView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(name: "Apple", type: "水果", image: "apple", price: 40, purchaseDate: Date(), haveExp: true, exp: Date(timeIntervalSinceReferenceDate: 0))
    static var item2 = ItemModel(name: "牛排", type: "肉類食材", image: "beef", price: 500, purchaseDate: Date(), haveExp: true, exp: Date(timeIntervalSinceReferenceDate: 0))
    
    static var previews: some View {
        Group {
            ItemBlockView(item: item1)
            ItemBlockView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }}
