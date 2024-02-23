//
//  APButton.swift
//  Appertizer
//
//  Created by Long Nguyễn on 26/12/2023.
//

import SwiftUI

struct APButton: View {
   
   var title: LocalizedStringKey
   
    var body: some View {
       Text(title)
          .font(.title3)
          .fontWeight(.semibold)
          .frame(width: 260, height: 50)
          .foregroundStyle(.white)
          .background(Color.brandPrimary)
          .cornerRadius(10)
    }
}

#Preview {
   APButton(title: "Test")
}
