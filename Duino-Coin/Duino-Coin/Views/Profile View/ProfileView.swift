//
//  ProfileView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/1/21.
//

import SwiftUI

// MARK: - Profile View
struct ProfileView: View {
    
    // MARK: - Properties
    
    // body
    var body: some View {
        VStack {
            TopLogoView()
            ImageAndNameView()
        }
    } //: body
}


// MARK: -  Previews
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
    }
}
