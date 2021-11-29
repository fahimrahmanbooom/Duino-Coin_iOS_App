//
//  LoginView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/29/21.
//

import SwiftUI

// MARK: Login View
struct LoginView: View {
    
    // MARK: Properties
    @Binding var username: String
    @Binding var password: String
    
    // body
    var body: some View {
        // geometry reader
        GeometryReader { _ in
            // zstack
            ZStack {
                // vstack
                VStack {
                    TopLogoView()
                    Spacer()
                    LoginTextView()
                    CredentialView(username: $username, password: $password)
                    Spacer()
                    ButtonView()
                    Spacer()
                } //: vstack
            } //: zstack
        } //: geometry reader
    } //: body
}


// MARK: Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(username: .constant(""), password: .constant(""))
    }
}
