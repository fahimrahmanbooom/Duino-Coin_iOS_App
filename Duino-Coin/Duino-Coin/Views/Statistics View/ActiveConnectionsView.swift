//
//  ActiveConnectionsView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/7/21.
//

import SwiftUI

// MARK: - Active Connections View
struct ActiveConnectionsView: View {
    
    // MARK: - Properties
    @Binding var activeConnections: String
    
    // body
    var body: some View {
        // vstack
        VStack {
            // hstack
            HStack {
                // vstack
                VStack(alignment: .leading) {
                    
                    Image(systemName: "point.3.connected.trianglepath.dotted")
                        .resizable()
                        .frame(width: 45, height: 35)
                        .foregroundColor(.white)
                        .font(Font.title.weight(.thin))
                        .padding([.leading, .trailing, .top])
                    
                    Text("Active Connections")
                        .foregroundColor(.white)
                        .fontWeight(.regular)
                        .padding([.leading, .trailing, .bottom])
                } // vstack
                
                Spacer()
            } //: hstack
            
            Spacer()
            
            // hstack
            HStack {
                
                Text(activeConnections)
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding([.leading, .bottom])
                
                Spacer()
            } //: hstack
        } //: vstack
        .frame(width: UIScreen.main.bounds.width / 2.2, height: UIScreen.main.bounds.width / 2.2)
        .background(RadialGradient(gradient: Gradient(colors: [.customRed, .black]), center: .center, startRadius: 2, endRadius: 450))
        .cornerRadius(10)
        .shadow(color: .primary, radius: 0.4)
    } // body
}


// MARK: - Preview
struct ActiveConnectionsView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveConnectionsView(activeConnections: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
