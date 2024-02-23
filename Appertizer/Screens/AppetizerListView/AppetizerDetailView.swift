//
//  AppetizerDetailView.swift
//  Appertizer
//
//  Created by Long Nguyễn on 26/12/2023.
//

import SwiftUI

struct AppetizerDetailView: View {
   
   @EnvironmentObject var order: Order
   
   var appetizer: Appetizer
   @Binding var isShowingDetail: Bool
   
    var body: some View {
       VStack {
          AppetizerRemoteImage(urlString: appetizer.imageURL)
             .aspectRatio(contentMode: .fill)
             .frame(height: 225)
          
          VStack {
             Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
             
             Text(appetizer.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
             
             HStack(spacing: 20) {
                NutritionInfo(title: "Calories", value: appetizer.calories)
                NutritionInfo(title: "Carbs", value: appetizer.carbs)
                NutritionInfo(title: "Protein", value: appetizer.protein)
             }
             
             Spacer()
             
             Button(action: {
                order.add(appetizer)
                isShowingDetail = false
             }, label: {
//                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
             })
             .modifier(StandardButtonStyle())
             .padding(.bottom, 30)
          }
       }
       .frame(width: 320, height: 525)
       .background(Color(.systemBackground))
       .cornerRadius(12)
       .shadow(radius: 40)
       .overlay(alignment: .topTrailing) {
          Button(action: {
             isShowingDetail = false
          }, label: {
             XDismissButton()
          })
       }
    }
}

#Preview {
   AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
}

struct NutritionInfo: View {
   
   let title: String
   let value: Int
   
   var body: some View {
      VStack(spacing: 5) {
         Text(title)
            .bold()
            .font(.caption)
         
         Text("\(value)")
            .foregroundStyle(.secondary)
            .fontWeight(.semibold)
            .italic()
      }
   }
}
