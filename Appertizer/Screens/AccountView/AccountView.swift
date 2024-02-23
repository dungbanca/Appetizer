//
//  AccountView.swift
//  Appertizer
//
//  Created by Long Nguyễn on 20/12/2023.
//

import SwiftUI

struct AccountView: View {
   
   @StateObject private var viewModel = AccountViewModel()
   @FocusState private var focusTextField: FormTextField?
   
   enum FormTextField {
      case firstName, lastName, email
   }
   
    var body: some View {
       NavigationView {
          Form(content: {
             Section {
                TextField("First Name", text: $viewModel.user.firstName)
                   .focused($focusTextField, equals: .firstName)
                   .onSubmit { focusTextField = .lastName }
                   .submitLabel(.next)
                
                TextField("Last Name", text: $viewModel.user.lastName)
                   .focused($focusTextField, equals: .lastName)
                   .onSubmit { focusTextField = .email }
                   .submitLabel(.next)
                
                TextField("Email", text: $viewModel.user.email)
                   .keyboardType(.emailAddress)
                   .textInputAutocapitalization(.never)
                   .focused($focusTextField, equals: .email)
                   .onSubmit { focusTextField = nil }
                   .submitLabel(.continue)
                
                DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                Button(action: {
                   viewModel.saveChanges()
                }, label: {
                   Text("Save Changes")
                })
             } header: {
                Text("Personal Info")
             }
             
             Section("Requests") {
                Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
             }
             .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))

          })
             .navigationTitle("🥳 Account")
             .toolbar(content: {
                ToolbarItemGroup(placement: .keyboard, content: {
                   Button(action: {
                      focusTextField = nil
                   }, label: {
                      Text("Dismiss")
                   })
                })
             })
       }
       .alert(item: $viewModel.alertItem) { alertItem in
          Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
       }
       .onAppear(perform: {
          viewModel.retrieveUser()
       })
    }
}

#Preview {
    AccountView()
}
