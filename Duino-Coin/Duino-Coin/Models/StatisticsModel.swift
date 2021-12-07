//
//  StatisticsModel.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/6/21.
//

import Foundation

// MARK: - Statistics Model

struct StatisticsModel: Codable {
    
    var activeConnections: Int?
    var allTimeMinedDUCO: Double? //
    var currentDifficulty: Int?
    var ducoS1Hashrate: String?
    var netEnergyUsage: String?
    var registeredUsers: Int?
    var serverCPUUsage: Double?
    var serverRAMUsage: Double?
    var serverVersion: Double?
    var minerDistribution: [String: Int]? //
    
    
    enum CodingKeys: String, CodingKey {
        case activeConnections = "Active connections"
        case allTimeMinedDUCO = "All-time mined DUCO"
        case currentDifficulty = "Current difficulty"
        case ducoS1Hashrate = "DUCO-S1 hashrate"
        case minerDistribution = "Miner distribution"
        case netEnergyUsage = "Net energy usage"
        case registeredUsers = "Registered users"
        case serverCPUUsage = "Server CPU usage"
        case serverRAMUsage = "Server RAM usage"
        case serverVersion = "Server version"
    }
}
