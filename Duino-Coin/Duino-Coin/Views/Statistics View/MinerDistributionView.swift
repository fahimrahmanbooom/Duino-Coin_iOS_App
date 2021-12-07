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
                .foregroundColor(.white)
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
                        .foregroundColor(.white)
                        .font(Font.title.weight(.thin))
                        .padding([.leading, .top, .bottom])
                    
                    // model name
                    Text(item)
                        .foregroundColor(.white)
                        .fontWeight(.regular)
                        .padding([.leading, .top, .bottom])
                    
                    Spacer()
                    
                    // quantity
                    Text("\(minerDistribution[item] ?? 0)")
                        .foregroundColor(.white)
                        .fontWeight(.regular)
                        .padding([.trailing, .top, .bottom])
                    
                } //: hstack
            } // foreach
        } //: vstack
        .frame(maxWidth: .infinity)
        .background(RadialGradient(gradient: Gradient(colors: [.customRed, .black]), center: .center, startRadius: 2, endRadius: 1000))
        .cornerRadius(10)
        .shadow(color: .primary, radius: 0.4)
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
