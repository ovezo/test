//
//  LoginRestController.swift
//  Test
//
//  Created by Owez Orazberdiyew on 4/20/21.
//

import Foundation

class LoginRestController {
    
    static public func login(login: String, password: String, onError: @escaping (String)->(), onSuccess: @escaping ()->()){
        Request.execute(
            url: Rest.LOGIN,
            method: "POST",
            body: ["login": login, "password": password],
            params: nil,
            shouldAuth: false,
            onError: onError,
            onResult: {
                (result) -> () in
                onResult(result: result, onError: onError, onSuccess: onSuccess)
            }
        )
    }
    
    static private func onResult(result: Data, onError: @escaping (String)->(), onSuccess: @escaping ()->()){
        let decoder = JSONDecoder()
        do{
            let httpResponse = try decoder.decode(HTTPLoginResponse.self, from: result)
            DispatchQueue.main.async {
                if let error = httpResponse.error {
                    onError(error.error_msg ?? "Something went wrong (")
                } else {
                    if let token = httpResponse.response?.token {
                        User.setToken(token)
                        onSuccess()
                    } else {
                        onError("Something went wrong (")
                    }
                }
            }
        }catch{
            DispatchQueue.main.async {
                onError(error.localizedDescription)
            }
        }
    }
    
}
