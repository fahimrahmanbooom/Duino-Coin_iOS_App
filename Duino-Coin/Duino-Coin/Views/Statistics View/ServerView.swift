//
//  ServerView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/7/21.
//

import SwiftUI

// MARK: - Server View
struct ServerView: View {
    
    // MARK: - Properties
    @Binding var serverVersion: String
    @Binding var serverCPU: String
    @Binding var serverRAM: String
    
    // body
    var body: some View {
        // vstack
        VStack {
            // hstack
            HStack {
                // vstack
                VStack(alignment: .leading) {
                    // icon
                    Image(systemName: "server.rack")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.black)
                        .font(Font.title.weight(.thin))
                        .padding([.leading, .trailing, .top])
                    
                    // headline
                    Text("Server")
                        .foregroundColor(.black)
                        .fontWeight(.regular)
                        .padding([.leading, .trailing, .bottom])
                } //: vstack
                Spacer()
            } // hstack
            
            
            Spacer()
            
            
            // hstack
            HStack {
                // vstack
                VStack(alignment: .leading, spacing: 1) {
        
                    Text("Version")
                        .foregroundColor(.black)
                        .fontWeight(.regular)
                    Text("CPU")
                        .foregroundColor(.black)
                        .fontWeight(.regular)
                    Text("RAM")
                        .foregroundColor(.black)
                        .fontWeight(.regular)
                    
                } //: vstack
                .padding([.leading, .bottom])
                
                Spacer()
                
                // vstack
                VStack(alignment: .trailing, spacing: 1) {
                    
                    Text(serverVersion)
                        .foregroundColor(.customOrange)
                        .fontWeight(.semibold)
                    Text("\(serverCPU) %")
                        .foregroundColor(.customOrange)
                        .fontWeight(.semibold)
                    Text("\(serverRAM) %")
                        .foregroundColor(.customOrange)
                        .fontWeight(.semibold)
                    
                } //: vstack
                .padding([.trailing, .bottom])
            } //: hstack
        }
        .frame(width: UIScreen.main.bounds.width / 2.2, height: UIScreen.main.bounds.width / 2.2)
        .background(Color.customGray)
        .cornerRadius(10)
    } // body
}


// MARK: - Preview
struct ServerView_Previews: PreviewProvider {
    static var previews: some View {
        ServerView(serverVersion: .constant(""), serverCPU: .constant(""), serverRAM: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
