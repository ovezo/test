//
//  HTTPResponseLogin.swift
//  Test
//
//  Created by Owez Orazberdiyew on 4/20/21.
//

import Foundation

class HTTPPaymentsResponse {
    public var success: String?
    public var error: HTTPError?
    
    var response: [Payment]?
    
    init(data: [String: Any]?){
        success = data?["status"] as? String
        error = HTTPError(dict: data?["error"] as? [String: Any])
        
        response = []
        for p in (data?["response"] as? [[String: Any]]) ?? [] {
            response!.append(Payment(dict: p))
        }
    }
}
