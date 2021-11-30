//
//  Duino_CoinApp.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/28/21.
//

import SwiftUI

@main
struct Duino_CoinApp: App {
    
    @AppStorage("loggedIn") var loggedIn: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if !loggedIn {
                LoginView()
            }
            else {
                EmptyView() // Home View
            }
        }
    }
}
