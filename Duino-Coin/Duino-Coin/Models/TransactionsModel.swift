//
//  TransactionsModel.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/7/21.
//

import Foundation

// MARK: - TransactionsModel

struct TransactionsModel: Codable {
    
    var result: [TransactionsResponse]?
    var success: Bool?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case success
    }
}

// MARK: - Result

struct TransactionsResponse: Codable {
    var amount: Double?
    var recipient: String?
    var sender: String?
    var datetime: String?
}
