//
//  URLs.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/29/21.
//

import Foundation

extension URL {
    
    // base URL
    private static let baseURLString = "https://server.duinocoin.com/"
    
    // login url
    static func loginURL(username: String, password: String) -> URL? {
        
        guard let encodedUsername = username.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
              let encodedPassword = password.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return nil
              }
        
        if let url = URL(string: "\(baseURLString)auth/\(encodedUsername)?password=\(encodedPassword)") {
            return url
        }
        return nil
    }
    
    // ...
}
