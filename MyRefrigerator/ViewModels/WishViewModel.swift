//
//  WishViewModel.swift
//  MyRefrigerator
//
//  Created by Poter Pan on 2022/4/16.
//

import Foundation

class WishViewModel: ObservableObject {
    
    @Published var items: [WishModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "wishes_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([WishModel].self, from: data)
        else { return }

        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = WishModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: WishModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}

