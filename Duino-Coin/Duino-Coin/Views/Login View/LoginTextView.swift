//
//  LoginTextView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/29/21.
//

import SwiftUI

// MARK: - Login Text View
struct LoginTextView: View {
    
    // body
    var body: some View {
        // hstack
        HStack {
            // text
            Text("Login")
                .foregroundColor(.secondary)
                .font(.system(size: 35, weight: .bold, design: .default))
            
            Spacer()
        } //: hstack
        .padding([.leading, .trailing], 10)
    } //: body
}



// MARK: - Preview
struct LoginTextView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextView()
            .previewLayout(.sizeThatFits)
    }
}
