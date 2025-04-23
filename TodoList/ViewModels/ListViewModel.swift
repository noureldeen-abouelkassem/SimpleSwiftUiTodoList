//
//  ListViewModel.swift
//  TodoList
//
//  Created by noureldeen abouelkassem on 21/04/2025.
//

import Foundation

class ListViewModel : ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_key"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let items = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = items
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addNewItem(title: String){
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletaionStatus()
        }
    }
    
    func saveItems() {
        let items = try? JSONEncoder().encode(items)
        guard let items = items else { return }
        UserDefaults.standard.set(items, forKey: itemsKey)
    }
}
