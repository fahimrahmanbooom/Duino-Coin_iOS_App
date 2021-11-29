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
        // group box
        GroupBox {
            // hstack
            HStack {
                // text
                Text("Login")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    .font(.title)
                
                Spacer()
            } //: hstack
        } //: group box
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
