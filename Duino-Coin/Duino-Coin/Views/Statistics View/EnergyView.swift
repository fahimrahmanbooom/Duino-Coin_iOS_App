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
                        .foregroundColor(.white)
                        .font(Font.title.weight(.thin))
                        .padding([.leading, .trailing, .top])
                    
                    Text("Energy")
                        .foregroundColor(.white)
                        .fontWeight(.regular)
                        .padding([.leading, .trailing, .bottom])
                } //: vstack
                Spacer()
            } //: hstack
            
            Spacer()
            
            // hstack
            HStack {
                
                Text("Usage")
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .lineLimit(1)
                    .padding([.leading, .bottom])
                
                Spacer()
                
                Text(energy)
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .lineLimit(1)
                    .padding([.trailing, .bottom])
            } //: hstack
        }//: vstack
        .frame(width: UIScreen.main.bounds.width / 2.2, height: UIScreen.main.bounds.width / 2.2)
        .background(RadialGradient(gradient: Gradient(colors: [.customRed, .black]), center: .center, startRadius: 2, endRadius: 450))
        .cornerRadius(10)
        .shadow(color: .primary, radius: 0.4)
    } // body
}


// MARK: - Preview
struct EnergyView_Previews: PreviewProvider {
    static var previews: some View {
        EnergyView(energy: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
