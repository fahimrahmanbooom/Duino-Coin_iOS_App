//
//  DucoPriceModel.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/3/21.
//

import Foundation


// MARK: - Duco Price Model

struct DucoPriceModel: Codable {
    var ducoPriceInUSD: Double?
    
    enum CodingKeys: String, CodingKey {
        case ducoPriceInUSD = "Duco price"
    }
}
