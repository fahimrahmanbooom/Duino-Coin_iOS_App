//
//  DashboardView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/30/21.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    TopLogoView()
                    Spacer()
                    UsernameTextView()
                    Spacer()
                    QuickStatusView()
                    Spacer()
                    MinersListView()
                    Spacer()
                }
            }
            .clipped()
            .navigationBarHidden(true)
        }
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
