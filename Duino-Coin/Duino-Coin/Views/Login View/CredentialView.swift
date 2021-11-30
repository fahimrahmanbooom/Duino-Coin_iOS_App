//
//  CredentialView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/29/21.
//

import SwiftUI

// enum Field
private enum Field: Hashable {
    case username, password
}


// MARK: - Credential View
struct CredentialView: View {
    
    // MARK: Properties
    @FocusState private var focusedField: Field?
    
    @ObservedObject var credentials: Credentials
    
    // body
    var body: some View {
        // group box
        GroupBox {
            // vstack
            VStack {
                // hstack
                HStack {
                    // icon
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundColor(Color.customOrange)
                        .frame(width: 25, height: 25)
                    
                    // text input field
                    TextField("Username", text: $credentials.username)
                        .padding([.top, .bottom, .trailing], 20)
                        .padding(.leading, 10)
                        .keyboardType(.namePhonePad)
                        .textFieldStyle(.roundedBorder)
                        .focused($focusedField, equals: .username)
                    
                } //: hstack
                .padding(.top, 0)
                
                // hstack
                HStack {
                    // icon
                    Image(systemName: "lock.fill")
                        .resizable()
                        .foregroundColor(Color.customOrange)
                        .frame(width: 20, height: 26)
                    
                    // text input field
                    SecureField("Password", text: $credentials.password)
                        .padding([.top, .bottom, .trailing], 20)
                        .padding(.leading, 15)
                        .textFieldStyle(.roundedBorder)
                        .focused($focusedField, equals: .password)
                        
                } //: hstack
                .padding(.bottom, 0)
            } //: vstack
            .task  {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.focusedField = .username
                } //: DispatchQueue
            } //: task
        } //: group box
        .padding([.leading, .trailing], 10)
    }
}



// MARK: Preview
struct CredentialView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialView(credentials: .init())
            .previewLayout(.sizeThatFits)
    }
}
