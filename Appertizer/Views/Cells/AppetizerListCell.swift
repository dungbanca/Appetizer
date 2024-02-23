//
//  AppetizerListItemView.swift
//  Appertizer
//
//  Created by Long Nguyễn on 21/12/2023.
//

import SwiftUI

struct AppetizerListCell: View {
   
   var appetizer: Appetizer
   
    var body: some View {
       HStack {
//          AppetizerRemoteImage(urlString: appetizer.imageURL)
//             .aspectRatio(contentMode: .fit)
//             .frame(width: 110, height: 80)
//             .scaledToFit()
//             .cornerRadius(10)
          AsyncImage(url: URL(string: appetizer.imageURL)) { image in
             image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 110, height: 80)
                .cornerRadius(8)
          } placeholder: {
             Image("food-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 110, height: 80)
                .cornerRadius(8)
          }

          
          VStack(alignment: .leading, spacing: 5) {
             Text(appetizer.name)
                .font(.system(size: 20, weight: .medium))
             
             Text("$\(appetizer.price, specifier: "%.2f")")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.secondary)
          }
          .padding(.leading)
       }
    }
}

#Preview {
   AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
