//
//  ItemViewModel.swift
//  MyRefrigerator
//
//  Created by Poter Pan on 2022/4/1.
//

import Foundation

// CRUD
// Create Read Update Delete

class ItemViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func createDefultItems() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let someDateTime: Date = formatter.date(from: "2022/10/08")!

        let newItems = [
            ItemModel(name: "蘋果", type: "Fruit", image: "apple", price: 100, purchaseDate: Date(), haveExp: true, exp: someDateTime),
            ItemModel(name: "白菜", type: "Vegetable", image: "vegetable", price: 30, purchaseDate: Date(), haveExp: true, exp: Date(timeIntervalSinceReferenceDate: 0)),
            ItemModel(name: "牛排", type: "Meat", image: "beef", price: 1023, purchaseDate: Date(), haveExp: true, exp: someDateTime)
            
        ]
        items.append(contentsOf: newItems)

    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(name: String, type: String, price: Double, purchaseDate: Date, haveExp: Bool, exp: Date) {
        let newItem = ItemModel(name: name, type: type, image: "", price: price, purchaseDate: purchaseDate, haveExp: haveExp, exp: exp)
        items.append(newItem)
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    
}
