//
//  OrderView.swift
//  Appertizer
//
//  Created by Long Nguyễn on 20/12/2023.
//

import SwiftUI

struct OrderView: View {
   
   @EnvironmentObject var order: Order
   
   var body: some View {
      NavigationView {
         ZStack {
            VStack {
               List {
                  ForEach(order.items) { item in
                     AppetizerListCell(appetizer: item)
                  }
                  .onDelete(perform: { indexSet in
                     order.items.remove(atOffsets: indexSet)
                  })
               }
               .listStyle(.plain)
               
               Button(action: {
                  
               }, label: {
                  Text("$\(order.totalPrice, specifier: "%.2f") Place Order")
               })
               .modifier(StandardButtonStyle())
               .padding(.bottom, 25)
            }
            
            if order.items.isEmpty {
               EmptyState(imageName: "food-placeholder",
                          titleName: "You have no item in your order. Please add an appetizer!")
               .background(.white)
            }
         }
         .navigationTitle("✋ Order")
      }
   }
   
   func deleteItem(at offSet: IndexSet) {
      order.items.remove(atOffsets: offSet)
   }
}

#Preview {
   OrderView()
}
