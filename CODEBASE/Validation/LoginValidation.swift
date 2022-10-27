//
//  LoginValidation.swift
//  CODEBASE
//
//  Created by Abdul Moiz on 26/10/2022.
//

import Foundation


struct ValidationResult{
    var success:Bool = false
    var errorMessage:String?
}


struct LoginValidation{
    
    func validateUserInput(userEmail:String , userPassword:String) -> ValidationResult {
        
        if userEmail.isEmpty ||  userPassword.isEmpty {
            return ValidationResult(success: false , errorMessage:  "User Email and Password cannnot be Empty!")
            
        }
        
        if isValidEmail(value: userEmail) == false {
            return ValidationResult(success: false , errorMessage:  "User Email Format is Incorrect!")
            
        }
        return ValidationResult(success: true , errorMessage:  nil)
        
        
    }
    
    private func isValidEmail(value:String) -> Bool {
     
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in:value, options: [], range: NSRange(location: 0, length: value.count)) != nil
    }
    
    
    
}
