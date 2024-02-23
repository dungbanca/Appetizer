//
//  RemoteImage.swift
//  Appertizer
//
//  Created by Long Nguyễn on 26/12/2023.
//

import SwiftUI

final class ImageLoader: ObservableObject {
   
   @Published var image: Image?
   
   func loadImage(fromURLString urlString : String) {
      NetworkManager.shared.downloadImage(fromUrlString: urlString) { uiImage in
         guard let uiImage else { return }
         DispatchQueue.main.async {
            self.image = Image(uiImage: uiImage)
         }
      }
   }
}

struct RemoteImage: View {
   
   var image: Image?
   
   var body: some View {
      image?.resizable() ?? Image("food-placeholder").resizable()
   }
}

struct AppetizerRemoteImage: View {
   
   @StateObject var imageLoader = ImageLoader()
   var urlString: String
   
   var body: some View {
      
      RemoteImage(image: imageLoader.image)
         .onAppear(perform: {
            imageLoader.loadImage(fromURLString: urlString)
         }) 
   }
}
