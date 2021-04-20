//
//  Request.swift
//  Test
//
//  Created by Owez Orazberdiyew on 4/20/21.
//

import UIKit


class Request {
    
    static func execute(url _url: String, method: String, body: [String: Any]?, params: [String: String]?, shouldAuth: Bool?, onError: @escaping (String)->(), onResult: @escaping (Data)->()){
        
        var parameters = params
        
        // Set token if authorization is required for this request
        if (shouldAuth != nil && shouldAuth!) {
            if let accessToken = User.getToken() {
                if (parameters == nil){
                    parameters = ["token": accessToken]
                } else {
                    parameters!["token"] = accessToken
                }
            }
        }
        
        // Prepare URL
        var components = URLComponents(string: _url)!
        if let params = parameters {
            components.queryItems = params.map { (key, value) in
                URLQueryItem(name: key, value: value)
            }
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        // Prepare URL Request Object
        var request = URLRequest(url: components.url!)
        request.httpMethod = method
        
        // Set HTTP body if body is available
        if let body = body {
            let jsonData =  try? JSONSerialization.data(withJSONObject: body)
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        // Set header
        request.setValue("12345", forHTTPHeaderField: "app-key")
        request.setValue("1", forHTTPHeaderField: "v")

        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            // Check for Error
            if let error = error {
                DispatchQueue.main.async {
                    onError(error.localizedDescription)
                }
                return
            }
            // Convert HTTP Response Data to a HTTPResponse
            if let data = data {
                onResult(data)
            }
        }
        task.resume()
    }
}


