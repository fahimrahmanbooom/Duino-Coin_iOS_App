//
//  UsernameTextView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/1/21.
//

import SwiftUI

// MARK: - Login Text View
struct UsernameTextView: View {
    
    // MARK: - Properties
    let isVerifiedUser: Bool = false
    
    // body
    var body: some View {
        // hstack
        HStack {
            // text
            Text("Hi, \(UserDefaults.standard.string(forKey: "username") ?? "")")
                .foregroundColor(.customGreen)
                .font(.title2)
                .bold()
            
            Spacer()
        
            // image
            Image(systemName: isVerifiedUser ? "checkmark.shield.fill" : "xmark.shield.fill")
                .resizable()
                .frame(width: 20, height: 25)
                .foregroundColor(isVerifiedUser ? .customGreen : .customRed)
        } //: hstack
        .padding(10)
    } //: body
}



// MARK: - Preview
struct UsernameTextView_Previews: PreviewProvider {
    static var previews: some View {
        UsernameTextView()
            .previewLayout(.sizeThatFits)
    }
}
