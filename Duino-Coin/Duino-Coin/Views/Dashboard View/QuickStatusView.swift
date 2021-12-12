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
    
    private let headlines = ["Total Hashrate", "DUCO Price", "DUCO Balance", "USD Balance"]

    @Binding var quickStatusData: [String: String]
    
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
                            Text(self.headlines[item])
                                .foregroundColor(.customOrange)
                                .font(.headline)
                                .bold()
                                .padding(.vertical, 5)
                                .lineLimit(1)
                            
                            // values
                            Text(quickStatusData[headlines[item]] ?? "")
                                .foregroundColor(.black)
                                .font(.subheadline)
                                .bold()
                                .padding(.vertical, 5)
                                .lineLimit(1)
                            
                        } //: vstack
                    } //: hstack
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.customGray)
                    .cornerRadius(10)
                } //: for each
            } //: grid
            .padding(10)
    } //: body
}



// MARK: - Preview

struct QuickStatusView_Previews: PreviewProvider {
    static var previews: some View {
        QuickStatusView(quickStatusData: .constant(["":""]))
            .previewLayout(.sizeThatFits)
    }
}
