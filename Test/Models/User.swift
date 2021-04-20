//
//  User.swift
//  Test
//
//  Created by Owez Orazberdiyew on 4/20/21.
//

import Foundation

class User {
    private static var token: String?
    
    public static func getToken() -> String? {
        return token
    }
    
    public static func setToken(_ token: String?) {
        self.token = token
    }
}
