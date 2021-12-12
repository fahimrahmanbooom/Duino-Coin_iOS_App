//
//  TabView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/30/21.
//

import SwiftUI


// MARK: - Duino Tab View

struct DuinoTabView: View {
    
    // MARK: - Properties
    
    // body
    var body: some View {
        // tab view
        TabView {
            DashboardView()
                .tabItem { Label("Dashboard", systemImage: "text.redaction") }
            StatisticsView()
                .tabItem { Label("Statistics", systemImage: "chart.xyaxis.line") }
            TransactionsView()
                .tabItem { Label("Transactions", systemImage: "arrow.left.arrow.right") }
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        } //: tab view
        .accentColor(.customOrange)
    } //: body
}



// MARK: - Preview
struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        DuinoTabView()
        
    }
}
