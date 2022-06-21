//
//  Int.swift
//  CasinoGames
//
//  Created by Behran Kankul on 20.06.2022.
//

import Foundation

extension Int {
    static func getRandomNumber() -> Int {
        return Int.random(in: 0..<1000)
    }
}
