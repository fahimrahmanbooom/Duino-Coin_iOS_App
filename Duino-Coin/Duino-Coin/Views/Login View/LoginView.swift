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
    @ObservedObject var credentials = Credentials()
    
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
                    CredentialView(credentials: credentials)
                    Spacer()
                    ButtonView(credentials: credentials)
                    Spacer()
                } //: vstack
            } //: zstack
        } //: geometry reader
    } //: body
}


// MARK: Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
