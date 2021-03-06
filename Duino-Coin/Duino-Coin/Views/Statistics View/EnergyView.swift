//
//  EnergyView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/7/21.
//

import SwiftUI

// MARK: - Energy View
struct EnergyView: View {
    
    // MARK: - Properties
    @Binding var energy: String
    
    // body
    var body: some View {
        // vstack
        VStack {
            // hstack
            HStack {
                // vstack
                VStack(alignment: .leading) {
                    
                    Image(systemName: "bolt")
                        .resizable()
                        .frame(width: 20, height: 35)
                        .foregroundColor(.black)
                        .font(Font.title.weight(.thin))
                        .padding([.leading, .trailing, .top])
                    
                    Text("Energy")
                        .foregroundColor(.black)
                        .fontWeight(.regular)
                        .padding([.leading, .trailing, .bottom])
                } //: vstack
                Spacer()
            } //: hstack
            
            Spacer()
            
            // hstack
            HStack {
                
                Text("Usage")
                    .foregroundColor(.black)
                    .fontWeight(.regular)
                    .lineLimit(1)
                    .padding([.leading, .bottom])
                
                Spacer()
                
                Text(energy)
                    .foregroundColor(.customOrange)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding([.trailing, .bottom])
            } //: hstack
        }//: vstack
        .frame(width: UIScreen.main.bounds.width / 2.2, height: UIScreen.main.bounds.width / 2.2)
        .background(Color.customGray)
        .cornerRadius(10)
    } // body
}


// MARK: - Preview
struct EnergyView_Previews: PreviewProvider {
    static var previews: some View {
        EnergyView(energy: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
