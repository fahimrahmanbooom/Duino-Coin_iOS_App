//
//  DoubleRounder.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 12/3/21.
//

import Foundation

// Double rounder
extension Double {
    func round(to decimalPlaces: Int) -> Double {
        let precisionNumber = pow(10,Double(decimalPlaces))
        var n = self // self is a current value of the Double that you will round
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}
