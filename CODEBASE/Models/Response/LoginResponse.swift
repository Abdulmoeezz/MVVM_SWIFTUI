//
//  LoginResponse.swift
//  CODEBASE
//
//  Created by Abdul Moiz on 26/10/2022.
//

import Foundation



struct LoginResponse : Decodable {
    let errorMessage:String?
    let data: LoginResponseData?
}

struct LoginResponseData : Decodable {
    let username,email :String
    let userID:Int
}
