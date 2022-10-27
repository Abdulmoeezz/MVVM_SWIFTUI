//
//  LoginViewModel.swift
//  CODEBASE
//
//  Created by Abdul Moiz on 26/10/2022.
//

import Foundation


struct LoginDataModel {
     var userEmail:String = String()
      var userPassword:String = String()
      var errorMessage:String = String()
      var navigate:Bool = false
      var isPresentingErrorAlert:Bool = false
}



class LoginViewModel : ObservableObject {

    
    @Published var  loginDataModel:LoginDataModel = LoginDataModel()
     private let loginValidation = LoginValidation()
    private let loginResource = LoginResource()

    
    func validateUserInput() -> Bool {
        
        let result = loginValidation.validateUserInput(userEmail: loginDataModel.userEmail, userPassword: loginDataModel.userPassword)
        if result.success == false {
            loginDataModel.errorMessage = result.errorMessage ?? "Error Occured Man!"
            loginDataModel.isPresentingErrorAlert = true
         return false
        }
        return true
    }
    
    func authenticateUser(){
        let loginRequest = LoginRequest(userEmail: loginDataModel.userEmail, userPassword: loginDataModel.userPassword)
        loginResource.authenticateUser(loginRequest: loginRequest) { response in
            
            DispatchQueue.main.async {
                if response?.errorMessage == nil {
                    self.loginDataModel.navigate = true
                }else{
                    self.loginDataModel.errorMessage = response?.errorMessage ?? "Error Occured!"
                    self.loginDataModel.isPresentingErrorAlert = true
                }
            }
        }
    }
    
    
}
