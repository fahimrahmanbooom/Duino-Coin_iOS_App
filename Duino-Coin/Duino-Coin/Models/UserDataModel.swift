//
//  UserDataModel.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/2/21.
//

import Foundation

// MARK: - User Data Model

struct UserDataModel: Codable {
    
    var result: Response?
    var success: Bool?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case success
    }
}

// MARK: - Result
struct Response: Codable {
    var balance: Balance?
    var miners: [Miner]?
}

// MARK: - Balance
struct Balance: Codable {
    var balance: Double?
    var verified: String?
}

// MARK: - Miner
struct Miner: Codable {
    var accepted: Int?
    var rejected: Int?
    var diff: Int?
    var hashrate: Double?
    var identifier: String?
    var pool: String?
}
