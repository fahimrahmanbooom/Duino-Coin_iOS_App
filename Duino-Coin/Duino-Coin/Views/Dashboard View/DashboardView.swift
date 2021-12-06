//
//  DashboardView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/30/21.
//

import SwiftUI

// MARK: - Dashboard View
struct DashboardView: View {
    
    // MARK: -  Properties
    @State private var userData = UserDataModel()
    @State private var ducoPrice = DucoPriceModel()
    
    @State private var quickStatusData = ["Total Hashrate": String(), "DUCO Price": String(), "DUCO Balance": String(), "USD Balance": String()]
    
    @State private var isVerifiedUser = String()
    
    @State private var timer = Timer.publish(every: 15, on: .main, in: .common).autoconnect()
    
    
    // body
    var body: some View {
        // navigation view
        NavigationView {
            // scroll view
            ScrollView(.vertical, showsIndicators: false) {
                // vstack
                VStack {
                    TopLogoView()
                    Spacer()
                    UsernameTextView(isVerifiedUser: $isVerifiedUser)
                    Spacer()
                    QuickStatusView(quickStatusData: $quickStatusData)
                    Spacer()
                    MinersListView(userData: $userData)
                } //: vstack
            } //: scroll view
            .clipped()
            .navigationBarHidden(true)
        } //: navigation view
        .task {
            await loadUserData()
            await loadDucoPrice()
            self.timer = timer.upstream.autoconnect()
        }
        .onReceive(self.timer) { _ in
            Task {
                await loadUserData()
                await loadDucoPrice()
            }
        }
        .onDisappear {
            self.timer.upstream.connect().cancel()
        }
    } //: body
    
    
    // user data load
    private func loadUserData() async {
        await Networking.getRequest(url: URL.userDataURL(username: UserDefaults.standard.string(forKey: "username") ?? ""), expecting: UserDataModel.self, completion: { result in
            do {
                try self.userData = result.get()
                
                self.isVerifiedUser = self.userData.result?.balance?.verified ?? ""
                
                DispatchQueue.main.async {
                    let totalHashrate = calculateTotalHashrate(miners: ( self.userData.result?.miners)!)
                    
                    if totalHashrate < 1000 {
                        self.quickStatusData["Total Hashrate"] = "\(totalHashrate.round(to: 3)) H/s"
                    }
                    else {
                        self.quickStatusData["Total Hashrate"] = "\((totalHashrate / 1000).round(to: 3)) KH/s"
                    }
                    self.quickStatusData["DUCO Balance"] = "\(self.userData.result?.balance?.balance?.round(to: 8) ?? 0.0) ᕲ"

                }
            } catch {
                print(error)
            }
        })
    } //: user data load
    
    
    // load duco price
    private func loadDucoPrice() async {
        await Networking.getRequest(url: URL.statisticsURL, expecting: DucoPriceModel.self, completion: { result in
            do {
                try ducoPrice = result.get()
                DispatchQueue.main.async {
                    let ducoPrice = self.ducoPrice.ducoPriceInUSD
                    let ducoBalance = self.userData.result?.balance?.balance
                    let balanceInUSD = (ducoBalance ?? 0.0) * (ducoPrice ?? 0.0)
                    
                    self.quickStatusData["DUCO Price"] = "$ \(ducoPrice ?? 0.0)"
                    self.quickStatusData["USD Balance"] = "$ \(balanceInUSD.round(to: 8))"
                }
            } catch {
                print(error)
            }
        })
    }
}


// calculating total hashrate from individual hashrates
extension DashboardView {
    // calculating the total hashrate of all miners
    private func calculateTotalHashrate(miners: [Miner]) -> Double {
        var totalHashrate: Double = Double()
        for miner in miners {
            totalHashrate += miner.hashrate ?? 0.0
        }
        return totalHashrate
    }
}



// MARK: - Preview
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
