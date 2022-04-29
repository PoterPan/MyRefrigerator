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
    
    var image: UIImage {
        do {
            return try FileManager().readImage(with: item.id)
        } catch {
            return UIImage(systemName: "photo.fill")!
        }
    }
    
    var body: some View {
        VStack {
            Image(uiImage: image)
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
    
    static var item1 = ItemModel(name: "Apple", type: "水果", price: 40, purchaseDate: Date(), haveExp: true, exp: Date(timeIntervalSinceReferenceDate: 0))
    static var item2 = ItemModel(name: "牛排", type: "肉類食材", price: 500, purchaseDate: Date(), haveExp: true, exp: Date(timeIntervalSinceReferenceDate: 0))
    
    static var previews: some View {
        Group {
            ItemBlockView(item: item1)
            ItemBlockView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }}
