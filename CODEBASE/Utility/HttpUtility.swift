//
//  HttpUtility.swift
//  CODEBASE
//
//  Created by Abdul Moiz on 26/10/2022.
//

import Foundation


class HttpUtility {

   static let shared = HttpUtility()
    private init() {}
    
    func postData<Generic:Decodable>(request:URLRequest ,resultType:Generic.Type ,completionHandler:@escaping(_ result:Generic?) -> Void){
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil && data != nil {
                let response = try? JSONDecoder().decode(resultType.self , from: data!)
                _ = completionHandler(response)
            }
        }
    }
}
