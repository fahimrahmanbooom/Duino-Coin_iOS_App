//
//  ButtonView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/29/21.
//

import SwiftUI

// Button View
struct ButtonView: View {
    
    // body
    var body: some View {
        
        GroupBox {
            
            VStack {
                
                Button {
                    // login operation
                } label: {
                    HStack {
                        Spacer()
                        Text("Login")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .frame(height: 20, alignment: .center)
                            .padding()
                            
                        Spacer()
                    }
                    .background(Color.customOrange)
                    .cornerRadius(10)
                }
                
                Button {
                    // register operation
                } label: {
                    HStack {
                        Spacer()
                        Text("Register")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.customOrange)
                            .frame(height: 20, alignment: .center)
                            .padding()
            
                        Spacer()
                    }
                    //.background(Color.secondary)
                    .cornerRadius(10)
                }
            }
        }
        .padding([.leading, .trailing], 10)
    } //: body
}


// MARK: - Preview
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
            .previewLayout(.sizeThatFits)
    }
}
