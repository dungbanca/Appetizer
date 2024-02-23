//
//  AppertizerApp.swift
//  Appertizer
//
//  Created by Long Nguyễn on 20/12/2023.
//

import SwiftUI

@main
struct AppertizerApp: App {
   
   var order = Order()
   
    var body: some Scene {
        WindowGroup {
           AppetizerTabView().environmentObject(order)
        }
    }
}
