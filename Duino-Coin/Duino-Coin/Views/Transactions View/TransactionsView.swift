//
//  TransactionsView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/30/21.
//

import SwiftUI

struct TransactionsView: View {
    
    // MARK: - Properties
    
    @State var loader: Bool = true
    @State private var transactionsData = TransactionsModel()
    @State private var timer = Timer.publish(every: 20, on: .main, in: .common).autoconnect()
    
    // body
    var body: some View {
        // zstack
        ZStack {
            // scroll view
            ScrollView(.vertical, showsIndicators: false) {
                // vstack
                VStack {
                    TopLogoView()
                    TransactionsRowView(transactionsData: $transactionsData)
                } //: vstack
            } //: scroll view
            .clipped()
            .blur(radius: self.loader ? 10 : 0)
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
            
            // show loader
            if self.loader {
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(.customOrange)
                    .scaleEffect(1.5)
            }
        } //: zstack
    } //: body
    
    
    // load user transactions data
    private func loadUserTransactionsData() async {
        
        await Networking.getRequest(url: URL.userTransactionsURL(username: UserDefaults.standard.string(forKey: "username") ?? ""), expecting: TransactionsModel.self, completion: { result in
            do {
                try self.transactionsData = result.get()
                self.loader = false
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
