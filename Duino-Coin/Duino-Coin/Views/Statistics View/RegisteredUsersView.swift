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
                        .frame(width: 70, height: 35)
                        .foregroundColor(.white)
                        .font(Font.title.weight(.thin))
                        .padding([.leading, .trailing, .top])
                    
                    Text("Registered Users")
                        .foregroundColor(.white)
                        .fontWeight(.regular)
                        .padding([.leading, .trailing, .bottom])
                } // vstack
                
                Spacer()
            } //: hstack
            
            Spacer()
            
            // hstack
            HStack {
                
                Text(registeredUsers)
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding([.leading, .bottom])
                
                Spacer()
            } //: hstack
        } //: vstack
        .frame(width: UIScreen.main.bounds.width / 2.2, height: UIScreen.main.bounds.width / 2.2)
        .background(RadialGradient(gradient: Gradient(colors: [.customRed, .black]), center: .center, startRadius: 2, endRadius: 450))
        .cornerRadius(10)
        .shadow(color: .primary, radius: 0.4)
    } // body
}


// MARK: - Preview
struct RegisteredUserView_Previews: PreviewProvider {
    static var previews: some View {
        RegisteredUsersView(registeredUsers: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
