//
//  LoginViewModel.swift
//  CODEBASE
//
//  Created by Abdul Moiz on 26/10/2022.
//

import Foundation


class LoginViewModel : ObservableObject {

    
    @Published  var userEmail:String = String()
    @Published  var userPassword:String = String()
    @Published  var errorMessage:String = String()
    @Published  var navigate:Bool = false
    @Published  var isPresentingErrorAlert:Bool = false
    private let loginValidation = LoginValidation()
    private let loginResource = LoginResource()

    
    func validateUserInput() -> Bool {
        
        let result = loginValidation.validateUserInput(userEmail: userEmail, userPassword: userPassword)
        if result.success == false {
            errorMessage = result.errorMessage ?? "Error Occured Man!"
            isPresentingErrorAlert = true
         return false
        }
        return true
    }
    
    func authenticateUser(){
        let loginRequest = LoginRequest(userEmail: userEmail, userPassword: userPassword)
        loginResource.authenticateUser(loginRequest: loginRequest) { response in
            
            DispatchQueue.main.async {
                if response?.errorMessage == nil {
                    self.navigate = true
                }else{
                       self.errorMessage = response?.errorMessage ?? "Error Occured!"
                        self.isPresentingErrorAlert = true
                }
            }
        }
    }
    
    
}
