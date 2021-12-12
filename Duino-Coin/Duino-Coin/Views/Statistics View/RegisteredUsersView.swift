//
//  RegisteredUsersView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/7/21.
//

import SwiftUI

// MARK: - Registered Users
struct RegisteredUsersView: View {
    
    // MARK: - Properties
    @Binding var registeredUsers: String
    
    // body
    var body: some View {
        // vstack
        VStack {
            // hstack
            HStack {
                // vstack
                VStack(alignment: .leading) {
                    
                    Image(systemName: "person.3")
                        .resizable()
                        .frame(width: 75, height: 35)
                        .foregroundColor(.black)
                        .font(Font.title.weight(.thin))
                        .padding([.leading, .trailing, .top])
                    
                    Text("Registered Users")
                        .foregroundColor(.black)
                        .fontWeight(.regular)
                        .padding([.leading, .trailing, .bottom])
                } // vstack
                
                Spacer()
            } //: hstack
            
            Spacer()
            
            // hstack
            HStack {
                
                Text(registeredUsers)
                    .foregroundColor(.customOrange)
                    .font(.title)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding([.leading, .bottom])
                
                Spacer()
            } //: hstack
        } //: vstack
        .frame(width: UIScreen.main.bounds.width / 2.2, height: UIScreen.main.bounds.width / 2.2)
        .background(Color.customGray)
        .cornerRadius(10)
    } // body
}


// MARK: - Preview
struct RegisteredUserView_Previews: PreviewProvider {
    static var previews: some View {
        RegisteredUsersView(registeredUsers: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
