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
    
    @State private var quickStatusData = [
        "Total Hashrate": String(),
        "DUCO Price": String(),
        "DUCO Balance": String(),
        "USD Balance": String()
    ]
    @State var loader: Bool = true
    @State private var userData = UserDataModel()
    @State private var ducoPrice = DucoPriceModel()
    @State private var isVerifiedUser = String()
    @State private var timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    // body
    var body: some View {
        
        // zstack
        ZStack {
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
            .blur(radius: self.loader ? 10 : 0)
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
            
            // show loader
            if self.loader {
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(.customOrange)
                    .scaleEffect(1.5)
            }
        } //: zstack
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
                    
                    // turn off loader
                    self.loader = false
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
                    
                    let ducoPrice = Double(self.ducoPrice.ducoPriceInUSD?.toString(decimal: 20) ?? "")
                    
                    let ducoBalance = self.userData.result?.balance?.balance
                    
                    let balanceInUSD = (ducoBalance ?? 0.0) * (ducoPrice ?? 0.0)
                    
                    self.quickStatusData["DUCO Price"] = "$ \((NSNumber(value: ducoPrice ?? 0.0).decimalValue))"
                    
                    self.quickStatusData["USD Balance"] = "$ \(balanceInUSD.toString(decimal: 10))"
                    
                    UserDefaults.standard.set(ducoBalance, forKey: "ducoBalance")
                    
                    // turn off loader
                    self.loader = false
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
