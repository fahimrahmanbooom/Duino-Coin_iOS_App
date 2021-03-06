//
//  StatisticsSquareView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/7/21.
//

import SwiftUI

// MARK: - Net Hashrate View
struct NetHashrateView: View {
    
    // MARK: - Properties
    @Binding var netHashrate: String
    
    // body
    var body: some View {
        // HStack
        HStack {
            // VStack
            VStack(alignment: .leading) {
                
                // title
                Text("Net Hashrate")
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.regular)
                    .padding(.horizontal)
                    .padding(.vertical, 20)
                
                // subtitle
                Text(netHashrate)
                    .foregroundColor(.customOrange)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.vertical, 20)
            } //: VStack
            
            Spacer()
            
            // icon
            Image(systemName: "speedometer")
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.width / 5)
                .foregroundColor(.black)
                .font(Font.title.weight(.thin))
                .padding(.horizontal)
        } // HStack
        .background(Color.customGray)
        .cornerRadius(10)
        .padding(.horizontal, 10)
        //.padding(.vertical)
    } //: body
}



// MARK: Preview
struct NetHashrateView_Previews: PreviewProvider {
    static var previews: some View {
        NetHashrateView(netHashrate: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
