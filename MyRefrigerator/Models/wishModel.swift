//
//  wishModel.swift
//  MyRefrigerator
//
//  Created by Poter Pan on 2022/4/16.
//

import Foundation

struct WishModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> WishModel {
        return WishModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
