//
//  CurrencyRate.swift
//  Monobank
//
//  Created by Dima Shvets on 06.05.2021.
//

import Foundation
import CoreData

public struct CurrencyRate: Codable {
    let currencyCodeA: Int
    let currencyCodeB: Int
    let date: Date
    let rateBuy: Float?
    let rateCross: Float?
    let rateSell: Float?
    
    var displayCurrencyA: Currency?
    var displayCurrencyB: Currency?
}
