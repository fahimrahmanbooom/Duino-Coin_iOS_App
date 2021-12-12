//
//  TotalMinedView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/7/21.
//

import SwiftUI

// MARK: - Total Mined View

struct TotalMinedView: View {
    
    // MARK: - Properties
    @Binding var totalMined: String
    
    // body
    var body: some View {
        // vstack
        VStack {
            // hstack
            HStack {
                // vstack
                VStack(alignment: .leading) {
                    
                    Image(systemName: "hammer")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.black)
                        .font(Font.title.weight(.thin))
                        .padding([.leading, .trailing, .top])
                    
                    Text("Total Mined")
                        .foregroundColor(.black)
                        .fontWeight(.regular)
                        .padding([.leading, .trailing, .bottom])
                } // vstack
                
                Spacer()
            } //: hstack
            
            Spacer()
            
            // hstack
            HStack {
                
                Text("\(totalMined) ᕲ")
                    .foregroundColor(.customOrange)
                    .font(.title3)
                    .fontWeight(.semibold)
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
struct TotalMinedView_Previews: PreviewProvider {
    static var previews: some View {
        TotalMinedView(totalMined: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
