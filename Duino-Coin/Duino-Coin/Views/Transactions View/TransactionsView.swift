//
//  TransactionsView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/30/21.
//

import SwiftUI

struct TransactionsView: View {
    
    // MARK: - Properties
    @State private var timer = Timer.publish(every: 20, on: .main, in: .common).autoconnect()
    
    @State private var transactionsData = TransactionsModel()
    
    // body
    var body: some View {
        // Navigation View
        NavigationView {
            // scroll view
            ScrollView(.vertical, showsIndicators: false) {
                // vstack
                VStack {
                    TopLogoView()
                    TransactionsRowView(transactionsData: $transactionsData)
                } //: vstack
                .drawingGroup()
            } //: scroll view
            .clipped()
            .navigationBarHidden(true)
        } //: navigation view
        .task {
            await loadUserTransactionsData()
            self.timer = timer.upstream.autoconnect()
        }
        .onReceive(self.timer) { _ in
            Task {
                await loadUserTransactionsData()
            }
        }
        .onDisappear {
            self.timer.upstream.connect().cancel()
        }
    } //: body
    
    
    // load user transactions data
    private func loadUserTransactionsData() async {
        
        await Networking.getRequest(url: URL.userTransactionsURL(username: UserDefaults.standard.string(forKey: "username") ?? ""), expecting: TransactionsModel.self, completion: { result in
            do {
                try self.transactionsData = result.get()
            } catch {
                print(error)
            }
        })
    }
}



// MARK: - Preview
struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
    }
}
