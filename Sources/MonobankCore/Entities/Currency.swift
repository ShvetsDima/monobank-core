//
//  Currency.swift
//  Monobank
//
//  Created by Dima Shvets on 29.07.2021.
//

import Foundation

public struct Currency: Codable, Hashable {
    let currencyCode: String
    let currency: String
    let country: String
    let minorUnit: Int
    let digitsCode: Int
}
