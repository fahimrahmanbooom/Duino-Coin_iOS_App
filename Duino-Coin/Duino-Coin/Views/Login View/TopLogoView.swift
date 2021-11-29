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
            Image("duinoCoinLogo")
                .resizable()
                .frame(width: 80, height: 80)
                .opacity(isAnimated ? 1 : 0)
                .offset(x: isAnimated ? 0 : -25, y: 0)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimated.toggle()
                    }
                })
            
            // text
            Text("Duino-Coin")
                .foregroundColor(.secondary)
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
