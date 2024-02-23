//
//  AppetizerListView.swift
//  Appertizer
//
//  Created by Long Nguyễn on 20/12/2023.
//

import SwiftUI

struct AppetizerListView: View {
   
   @StateObject var viewModel = AppetizerListViewModel()
   
    var body: some View {
       ZStack {
          NavigationView {
             List(viewModel.appetizers, rowContent: { appetizer in
                AppetizerListCell(appetizer: appetizer)
                   .listRowSeparator(.automatic)
                   .listRowSeparatorTint(.brandPrimary)
                   .onTapGesture {
                      viewModel.selectedAppetizer = appetizer
                      viewModel.isShowingDetail = true
                   }
             })
             .navigationTitle("🍭 Appetizers")
          }
          .task {
             viewModel.getAppetizers()
          }
          .blur(radius: viewModel.isShowingDetail ? 20 : 0)
          .disabled(viewModel.isShowingDetail)
          
          if viewModel.isShowingDetail {
             AppetizerDetailView(appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer, isShowingDetail: $viewModel.isShowingDetail)
          }
          
          if viewModel.isLoading {
             LoadingView()
          }
       }
       .alert(item: $viewModel.alertItem) { alertItem in
          Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
       }
    }
   
   
}

#Preview {
    AppetizerListView()
}
