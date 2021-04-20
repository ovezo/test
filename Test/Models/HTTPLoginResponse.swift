//
//  HTTPResponseLogin.swift
//  Test
//
//  Created by Owez Orazberdiyew on 4/20/21.
//

import Foundation

class HTTPLoginResponse: Decodable {
    public var success: String?
    public var error: HTTPError?

    var response: LoginResponse?
}

class LoginResponse: Decodable {
    var token: String
}
