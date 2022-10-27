//
//  ContentView.swift
//  CODEBASE
//
//  Created by Abdul Moiz on 26/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var loginViewModel = LoginViewModel()
    var body: some View {
        NavigationView {
            VStack{
                TextField("Email", text: $loginViewModel.userEmail).keyboardType(.emailAddress)
                SecureField("Password", text: $loginViewModel.userPassword)
                
                NavigationLink(destination: HomeView(),
                               isActive: $loginViewModel.navigate) {
                    Button (action: {
                        
                        if loginViewModel.validateUserInput(){
                            loginViewModel.authenticateUser()}
                        
                    },label: {
                        Text("LOGIN")
                      }).alert(isPresented: $loginViewModel.isPresentingErrorAlert,
                               content: {
                                Alert(title: Text("Alert"), message:Text(loginViewModel.errorMessage),
                                dismissButton: .cancel(Text("OK")))
                        })
                     }
            }.padding().textFieldStyle(.roundedBorder)
                .navigationTitle(Text("Login"))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
