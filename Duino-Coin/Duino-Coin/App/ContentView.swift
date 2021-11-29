//
//  ContentView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/28/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        LoginView(username: $username, password: $password)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
