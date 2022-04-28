//
//  itemModel.swift
//  MyRefrigerator
//
//  Created by Poter Pan on 2022/3/30.
//

import Foundation

struct ItemModel: Identifiable, Codable
{
    let id: String
    let name: String
    let type: String
    let image: String
    let price: Double
    let purchaseDate: Date
    let haveExp: Bool
    let exp: Date
    
    // Error : UUID - Immutable property will not be decoded because it is declared with an initial value which cannot be overwritten
    // Fixed by init
    
    init(id: String = UUID().uuidString, name: String, type: String, image: String, price: Double, purchaseDate: Date, haveExp: Bool, exp: Date) {
        self.id = id
        self.name = name
        self.type = type
        self.image = image
        self.price = price
        self.purchaseDate = purchaseDate
        self.haveExp = haveExp
        self.exp = exp
    }
    
}
