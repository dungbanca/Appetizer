//
//  ActivityIndicator.swift
//  Appertizer
//
//  Created by Long Nguyễn on 25/12/2023.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
   func makeUIView(context: Context) -> UIActivityIndicatorView {
      let indicatorView = UIActivityIndicatorView(style: .medium)
      indicatorView.color = .brandPrimary
      indicatorView.startAnimating()
      return indicatorView
   }
   
   func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
      
   }
   
    
}

struct LoadingView: View {
   
   var body: some View {
      ZStack {
         Color(.systemBackground)
            .ignoresSafeArea()
         
         ProgressView("Loading...")
            .progressViewStyle(CircularProgressViewStyle())
            .tint(.brandPrimary)
            .scaleEffect(2)
      }
   }
   
}


#Preview {
   LoadingView()
}
