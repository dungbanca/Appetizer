//
//  Order.swift
//  Appertizer
//
//  Created by Long Nguyễn on 02/01/2024.
//

import Foundation

final class Order: ObservableObject {
   
   @Published var items: [Appetizer] = []
   
   var totalPrice: Double {
      items.reduce(0) { $0 + $1.price }
   }
   
   func add(_ appetizer: Appetizer) {
      items.append(appetizer)
   }
   
   func deleteItem(at offset: IndexSet) {
      items.remove(atOffsets: offset)
   }
}
