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
                        .foregroundColor(.white)
                        .font(Font.title.weight(.thin))
                        .padding([.leading, .trailing, .top])
                    
                    Text("Total Mined")
                        .foregroundColor(.white)
                        .fontWeight(.regular)
                        .padding([.leading, .trailing, .bottom])
                } // vstack
                
                Spacer()
            } //: hstack
            
            Spacer()
            
            // hstack
            HStack {
                
                Text("\(totalMined) ᕲ")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
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
struct TotalMinedView_Previews: PreviewProvider {
    static var previews: some View {
        TotalMinedView(totalMined: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
