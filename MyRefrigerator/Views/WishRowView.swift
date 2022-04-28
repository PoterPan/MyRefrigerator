//
//  WishRowView.swift
//  MyRefrigerator
//
//  Created by Poter Pan on 2022/4/16.
//

import SwiftUI

struct WishRowView: View {
    
    let wish: WishModel
    
    var body: some View {
        HStack {
            Image(systemName: wish.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(wish.isCompleted ? .green : .red)
            Text(wish.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct WishRowView_Previews: PreviewProvider {
    
    static var wish1 = WishModel(title: "水果", isCompleted: false)
    static var wish2 = WishModel(title: "豬肉", isCompleted: true)

    static var previews: some View {
        Group {
            WishRowView(wish: wish1)
            WishRowView(wish: wish2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
