//
//  EmptyState.swift
//  Appertizer
//
//  Created by Long Nguyễn on 30/12/2023.
//

import SwiftUI

struct EmptyState: View {
   
   var imageName: String
   var titleName: String
   
    var body: some View {
       ZStack {
          Color(.systemBackground)
             .ignoresSafeArea()
          
          VStack {
             Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
             
             Text(titleName)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding([.leading, .trailing], 24)
          }
       }
       .offset(y: -50)
    }
}

#Preview {
   EmptyState(imageName: "food-placeholder", titleName: "This is our test message.\nI'm making it a little long for testing.")
}
