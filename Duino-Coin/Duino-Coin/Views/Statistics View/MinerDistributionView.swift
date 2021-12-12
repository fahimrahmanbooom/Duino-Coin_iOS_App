//
//  MinerDistributionView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/7/21.
//

import SwiftUI

// MARK: - Miner Distribution View
struct MinerDistributionView: View {
    
    // MARK: - Properties
    @Binding var minerDistribution: [String: Int]
    
    // body
    var body: some View {
        // vstack
        VStack(alignment: .center) {
            
            Text("Miner Distribution")
                .foregroundColor(.black)
                .font(.title3)
                .fontWeight(.regular)
                .padding()
            
            // foreach
            ForEach(minerDistribution.keys.sorted(), id: \.self) { item in
                // hstack
                HStack(alignment: .center) {
                    
                    // icon
                    Image(systemName: "hammer")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.customOrange)
                        .font(Font.title.weight(.light))
                        .padding([.leading, .top, .bottom])
                    
                    // model name
                    Text(item)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .padding([.leading, .top, .bottom])
                    
                    Spacer()
                    
                    // quantity
                    Text("\(minerDistribution[item] ?? 0)")
                        .foregroundColor(.customOrange)
                        .fontWeight(.semibold)
                        .padding([.trailing, .top, .bottom])
                    
                } //: hstack
            } // foreach
        } //: vstack
        .frame(maxWidth: .infinity)
        .background(Color.customGray)
        .cornerRadius(10)
        .padding([.horizontal, .bottom], 10)
    } // body
}



// MARK: - Preview
struct MinerDistributionView_Previews: PreviewProvider {
    static var previews: some View {
        MinerDistributionView(minerDistribution: .constant([String(): Int()]))
            .previewLayout(.sizeThatFits)
    }
}
