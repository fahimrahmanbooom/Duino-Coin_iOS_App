//
//  MinersListView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/2/21.
//

import SwiftUI

// MARK: - Miners List View
struct MinersListView: View {
    
    // MARK: - Properties
    // MARK: - Properties
    private let columns = [ GridItem(.flexible()) ]
    private let headlines = ["Total Hashrate", "DUCO Balance", "Estimated Profit", "DUCO Price"]
    private let headLinesColor: [Color] = [.customBlue, .customGreen, .customIndigo, .customRed]
    
    // body
    var body: some View {
        VStack {
            HStack {
                Text("Miners")
                    .foregroundColor(.customOrange)
                    .font(.title3)
                    .bold()
                    
                Spacer()
                
                Text("Total: 5")
                    .foregroundColor(.customOrange)
                    .font(.title3)
                    .bold()
            }
            .padding(10)
            
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
                        .background(RadialGradient(gradient: Gradient(colors: [.customRed, .customOrange]), center: .center, startRadius: 2, endRadius: 400))
                        .cornerRadius(10)
                    } //: for each
                } //: grid
                .padding(10)
        }
    } //: body
}


// MARK: - Preview
struct MinersListView_Previews: PreviewProvider {
    static var previews: some View {
        MinersListView()
            .previewLayout(.sizeThatFits)
    }
}
