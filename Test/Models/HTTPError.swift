//
//  HTTPResponse.swift
//  Test
//
//  Created by Owez Orazberdiyew on 4/20/21.
//

import Foundation
//
//class HTTPResponse: Decodable {
//    var public success: String?
//    var public error: HTTPError?
//}

class HTTPError: Decodable {
    var error_code: Int?
    var error_msg: String?
    
    init(dict: [String: Any]?){
        error_code = dict?["error_code"] as? Int
        error_msg = dict?["error_msg"] as? String
    }
}
