//
//  User.swift
//  Appertizer
//
//  Created by Long Nguyễn on 27/12/2023.
//

import Foundation

struct User: Codable {
   
   var firstName = ""
   var lastName = ""
   var email = ""
   var birthdate = Date()
   var extraNapkins = false
   var frequentRefills = false
}
