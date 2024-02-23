//
//  Appetizer.swift
//  Appertizer
//
//  Created by Long Nguyễn on 21/12/2023.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
   
   let id: Int
   let name: String
   let description: String
   let price: Double
   let imageURL: String
   let calories: Int
   let protein: Int
   let carbs: Int
}

struct AppetizerResponse: Decodable {
   let request: [Appetizer]
}

struct MockData {
   static let sampleAppetizer = Appetizer(id: 1,
                                          name: "Test Appetizer 1",
                                          description: "This is the description for my appetizer. It's so yummy",
                                          price: 9.99,
                                          imageURL: "",
                                          calories: 99,
                                          protein: 99,
                                          carbs: 99)
   
   static let sampleAppetizer2 = Appetizer(id: 2,
                                          name: "Test Appetizer 2",
                                          description: "This is the description for my appetizer. It's so yummy",
                                          price: 9.99,
                                          imageURL: "",
                                          calories: 99,
                                          protein: 99,
                                          carbs: 99)
   
   
   static let sampleAppetizer3 = Appetizer(id: 3,
                                          name: "Test Appetizer 3",
                                          description: "This is the description for my appetizer. It's so yummy",
                                          price: 9.99,
                                          imageURL: "",
                                          calories: 99,
                                          protein: 99,
                                          carbs: 99)
   
   static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
   static let orderItems = [sampleAppetizer, sampleAppetizer2, sampleAppetizer2]
}
