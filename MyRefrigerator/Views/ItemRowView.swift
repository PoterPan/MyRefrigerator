//
//  ItemRowView.swift
//  MyRefrigerator
//
//  Created by Poter Pan on 2022/3/30.
//

import SwiftUI

struct ItemRowView: View {
    
    @EnvironmentObject var itemViewModel: ItemViewModel
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding(5)
            VStack(alignment: .leading, spacing: 10) {
                Text(item.name)
                    .font(.title)
                
                Text("購入價格 \(item.price, specifier: "%.0f")元")
                Text("購買日期 \(item.purchaseDate.formatted(date: .numeric, time: .omitted))")
                Text("有效期限 \(item.exp.formatted(date: .numeric, time: .omitted))")
            }
        }
        .padding(3)
        
    }
}


struct ItemRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(name: "蘋果", type: "水果", image: "apple", price: 40, purchaseDate: Date(), haveExp: true, exp: Date())
    static var item2 = ItemModel(name: "牛排", type: "肉類食材", image: "beef", price: 500, purchaseDate: Date(), haveExp: true, exp: Date())
    static var previews: some View {
        Group {
            ItemRowView(item: item1)
            ItemRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
