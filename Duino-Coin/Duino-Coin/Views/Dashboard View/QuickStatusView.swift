//
//  QuickStatusView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/1/21.
//

import SwiftUI

// MARK: -  Quick Status View
struct QuickStatusView: View {
    
    // MARK: - Properties
    private let columns = [ GridItem(.flexible()), GridItem(.flexible()) ]
    private let headlines = ["Total Hashrate", "DUCO Balance", "Estimated Profit", "DUCO Price"]
    private let headLinesColor: [Color] = [.customBlue, .customGreen, .customIndigo, .customRed]
    
    // body
    var body: some View {
        // grid
            LazyVGrid(columns: columns, spacing: 10) {
                // for each
                ForEach(0..<4, id: \.self) { item in
                    // hstack
                    HStack {
                        // vstack
                        VStack {
                            // headlines
                            Text(headlines[item])
                                .foregroundColor(.white)
                                .font(.headline)
                                .bold()
                                .padding(.vertical, 5)
                            
                            // values
                            Text("712.21 KH/s")
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .bold()
                                .padding(.vertical, 5)
                        } //: vstack
                    } //: hstack
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(headLinesColor[item])
                    .cornerRadius(10)
                } //: for each
            } //: grid
            .padding(10)
    } //: body
}



// MARK: - Preview
struct QuickStatusView_Previews: PreviewProvider {
    static var previews: some View {
        QuickStatusView()
            .previewLayout(.sizeThatFits)
    }
}
