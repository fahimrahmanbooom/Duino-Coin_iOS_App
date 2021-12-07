//
//  StatisticsView.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/30/21.
//

import SwiftUI

// MARK: Statistics View
struct StatisticsView: View {
    
    // MARK: - Properties
    @State private var statisticsData = StatisticsModel()
    @State private var timer = Timer.publish(every: 15, on: .main, in: .common).autoconnect()
    @State private var netHashrate: String = String()
    @State private var serverVersion: String = String()
    @State private var serverCPU: String = String()
    @State private var serverRAM: String = String()
    @State private var energy: String = String()
    @State private var registeredUsers: String = String()
    @State private var activeConnections: String = String()
    @State private var CurrentDifficulty: String = String()
    @State private var totalMined: String = String()
    @State private var minerDistribution: [String: Int] = [String: Int]()
    
    private let columns = [ GridItem(.flexible()), GridItem(.flexible()) ]
    
    // body
    var body: some View {
        // Navigation View
        NavigationView {
            // scroll view
            ScrollView(.vertical, showsIndicators: false) {
                // vstack
                VStack {
                    TopLogoView()
                    
                    NetHashrateView(netHashrate: $netHashrate)
                    
                    LazyVGrid(columns: columns, spacing: 10) {
                        // server
                        ServerView(serverVersion: $serverVersion, serverCPU: $serverCPU, serverRAM: $serverRAM)
                        // energy
                        EnergyView(energy: $energy)
                        // registered users
                        RegisteredUsersView(registeredUsers: $registeredUsers)
                        // active connections
                        ActiveConnectionsView(activeConnections: $activeConnections)
                        // current difficulty
                        CurrentDifficultyView(currentDifficulty: $CurrentDifficulty)
                        // total mined
                        TotalMinedView(totalMined: $totalMined)
                    }
                    .padding(10)
                    
                    // miner distribution
                    MinerDistributionView(minerDistribution: $minerDistribution)
                } //: vstack
            } //: scroll view
            .clipped()
            .navigationBarHidden(true)
        } //: navigation view
        .task {
            await loadStatisticsData()
            self.timer = timer.upstream.autoconnect()
        }
        .onReceive(self.timer) { _ in
            Task {
                await loadStatisticsData()
            }
        }
        .onDisappear {
            self.timer.upstream.connect().cancel()
        }
    } //: body
    
    // load statistics data
    private func loadStatisticsData() async {
        
        await Networking.getRequest(url: URL.statisticsURL, expecting: StatisticsModel.self, completion: { result in
            do {
                try self.statisticsData = result.get()
                self.netHashrate = self.statisticsData.ducoS1Hashrate ?? "..."
                self.serverVersion = String(self.statisticsData.serverVersion ?? 0)
                self.serverCPU = String(self.statisticsData.serverCPUUsage ?? 0)
                self.serverRAM = String(self.statisticsData.serverRAMUsage ?? 0)
                self.energy = self.statisticsData.netEnergyUsage ?? ""
                self.registeredUsers = String(self.statisticsData.registeredUsers ?? 0)
                self.activeConnections = String(self.statisticsData.activeConnections ?? 0)
                self.CurrentDifficulty = String(self.statisticsData.currentDifficulty ?? 0)
                self.totalMined = String(self.statisticsData.allTimeMinedDUCO?.round(to: 2) ?? 0)
                self.minerDistribution = self.statisticsData.minerDistribution ?? ["nil": 0]
            } catch {
                print(error)
            }
        })
    }
}



// MARK: - Preview
struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
