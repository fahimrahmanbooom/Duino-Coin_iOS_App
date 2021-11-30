//
//  ButtonView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/29/21.
//

import SwiftUI

// Button View
struct ButtonView: View {
    
    // MARK: - Properties
    @AppStorage("loggedIn") var loggedIn: Bool?
    
    @State var loginModel: LoginModel?
    @State private var emptyFieldsAlert = false
    @State private var wrongCredentialAlert = false
    
    @ObservedObject var credentials: Credentials
    
    // body
    var body: some View {
        // groupbox
        GroupBox {
            // vstack
            VStack {
                // button
                Button {
                    // login operation task
                    if (credentials.username.isEmpty && credentials.password.isEmpty) || (credentials.username.isEmpty || credentials.password.isEmpty) {
                        // alert for empty field(s)
                        emptyFieldsAlert = true
                    }
                    else {
                        // login task
                        Task {
                            await Networking.getRequest(url: URL.loginURL(username: credentials.username, password: credentials.password), expecting: LoginModel.self, completion: { data in
                                do {
                                    try self.loginModel = data.get()
                                    if self.loginModel?.success == true {
                                        loggedIn = true
                                    }
                                    else {
                                        // alert for wrong credentials
                                        wrongCredentialAlert = true
                                    }
                                } catch {
                                    print(error)
                                }
                            })
                        } //: task
                    }
                } label: {
                    // hstack
                    HStack {
                        
                        Spacer()
                        
                        Text("Login")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .frame(height: 20, alignment: .center)
                            .padding()
                        
                        Spacer()
                    } //: hstack
                    .background(Color.customOrange)
                    .cornerRadius(10)
                } //: button
                .alert("Empty Field(s)", isPresented: $emptyFieldsAlert) {
                    Button("OK", role: .cancel) { }
                }
                .alert("Wrong Credentials", isPresented: $wrongCredentialAlert) {
                    Button("OK", role: .cancel) { }
                }
                
                
                
                // button
                Button {
                    // register operation
                } label: {
                    // hstack
                    HStack {
                        
                        Spacer()
                        
                        Text("Register")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.customOrange)
                            .frame(height: 20, alignment: .center)
                            .padding()
                        
                        Spacer()
                    } //: hstack
                    //.background(Color.secondary)
                    .cornerRadius(10)
                } //: button
            } //: vstack
        } //: groupbox
        .padding([.leading, .trailing], 10)
    } //: body
}


// MARK: - Preview
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(credentials: .init())
            .previewLayout(.sizeThatFits)
    }
}
