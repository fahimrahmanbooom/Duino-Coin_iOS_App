//
//  TopLogoView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/29/21.
//

import SwiftUI

// MARK: Top Logo View
struct TopLogoView: View {
    
    // MARK: - properties
    @State private var isAnimated: Bool = false
    
    // body
    var body: some View {
        // hstack
        HStack(alignment: .center, spacing: 0) {
            // image
            Image("leftCropDuinoCoinLogo")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.leading, 10)
                .opacity(isAnimated ? 1 : 0)
                .offset(x: isAnimated ? 0 : -25, y: 0)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimated = true
                    }
                })
            
            // text
            Text("Duino-Coin")
                .foregroundColor(.black)
                .font(.title3)
                .fontWeight(.heavy)
                .padding([.top, .bottom])
            
            Spacer()
        } //: hstack
    } //: body
}


// MARK: - Preview
struct TopLogoView_Previews: PreviewProvider {
    static var previews: some View {
        TopLogoView()
            .previewLayout(.sizeThatFits)
    }
}
