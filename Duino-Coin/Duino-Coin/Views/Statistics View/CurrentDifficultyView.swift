//
//  CurrentDifficultyView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/7/21.
//

import SwiftUI

// MARK: - Net Difficulty View
struct CurrentDifficultyView: View {
    
    // MARK: - Properties
    @Binding var currentDifficulty: String
    
    // body
    var body: some View {
        // vstack
        VStack {
            // hstack
            HStack {
                // vstack
                VStack(alignment: .leading) {
                    
                    Image(systemName: "cube")
                        .resizable()
                        .frame(width: 32, height: 35)
                        .foregroundColor(.white)
                        .font(Font.title.weight(.thin))
                        .padding([.leading, .trailing, .top])
                    
                    Text("Current Difficulty")
                        .foregroundColor(.white)
                        .fontWeight(.regular)
                        .padding([.leading, .trailing, .bottom])
                } // vstack
                
                Spacer()
            } //: hstack
            
            Spacer()
            
            // hstack
            HStack {
                
                Text(currentDifficulty)
                    .foregroundColor(.customOrange)
                    .font(.title)
                    .fontWeight(.semibold)
                    .lineLimit(1)
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
struct CurrentDifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentDifficultyView(currentDifficulty: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
