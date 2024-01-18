//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Uday Gajera on 18/01/24.
//

import Foundation

/*
 CRUD function
 create
 read
 update
 delete
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    
    let itemKey: String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
        
//       let newItems = [
//            ItemModel(title: "this is the first title", isCompleted: false),
//            ItemModel(title: "second title", isCompleted: true),
//            ItemModel(title: "third", isCompleted: false)
//        ]
//          items.append(contentsOf: newItems)
        guard 
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {
            return
        }
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        } {
//            
//        }
        if let index = items.firstIndex(where: {$0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
        
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
