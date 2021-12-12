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
    
    @State private var loginModel: LoginModel?
    @State private var emptyFieldsAlert = false
    @State private var wrongCredentialAlert = false
    
    @ObservedObject var credentials: Credentials
    @ObservedObject var loader: Loader
    
    @Environment(\.openURL) var openURL
    
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
                            self.loader.isLoading = true
                            await loadLoginData()
                        } //: task
                    }
                } label: {
                    // hstack
                    HStack {
                        
                        Spacer()
                        
                        Text("Login")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
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
                    openURL((URL(string: "https://wallet.duinocoin.com/register.html") ?? URL(string:"https://duinocoin.com/"))!)
                } label: {
                    // hstack
                    HStack {
                        
                        Spacer()
                        
                        Text("Register")
                            .fontWeight(.semibold)
                            .foregroundColor(.customOrange)
                            .frame(height: 20, alignment: .center)
                            .padding()
                        
                        Spacer()
                        
                    } //: hstack
                    .cornerRadius(10)
                } //: button
            } //: vstack
        } //: groupbox
        .padding([.leading, .trailing], 10)
    } //: body
    
    // load login data
    func loadLoginData() async {
        await Networking.getRequest(url: URL.loginURL(username: credentials.username, password: credentials.password), expecting: LoginModel.self, completion: { data in
            do {
                try self.loginModel = data.get()
                if self.loginModel?.success == true {
                    DispatchQueue.main.async {
                        loggedIn = true
                        self.loader.isLoading = false
                    }
                    UserDefaults.standard.set(credentials.username, forKey: "username")
                }
                else {
                    // alert for wrong credentials
                    DispatchQueue.main.async {
                        wrongCredentialAlert = true
                        self.loader.isLoading = false
                    }
                }
            } catch {
                print(error)
            }
        })
    } //: load login data
}


// MARK: - Preview
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(credentials: .init(), loader: .init())
            .previewLayout(.sizeThatFits)
    }
}
