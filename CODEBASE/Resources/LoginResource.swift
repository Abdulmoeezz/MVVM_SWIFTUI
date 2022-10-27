//
//  LoginResource.swift
//  CODEBASE
//
//  Created by Abdul Moiz on 26/10/2022.
//

import Foundation


class LoginResource {
    
    func authenticateUser(loginRequest:LoginRequest , completionHandler:@escaping(_ result:LoginResponse?) -> Void) {
        
        var url_request = URLRequest(url: URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/User/Login")!)
        url_request.httpMethod = "post"
        url_request.addValue("application/json", forHTTPHeaderField: "content-type")
        url_request.httpBody =  try? JSONEncoder().encode(loginRequest)
        
        HttpUtility.shared.postData(request: url_request, resultType: LoginResponse.self) { result in
            _ = completionHandler(result)
        }
    }
    
    
}
