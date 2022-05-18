//
//  CurrencyRate.swift
//  Monobank
//
//  Created by Dima Shvets on 06.05.2021.
//

import Foundation
import RealmSwift

public struct CurrencyRate: Codable, Identifiable {
    public var id: String {
        String(currencyCodeA) + String(currencyCodeB)
    }
    let currencyCodeA: Int
    let currencyCodeB: Int
    let date: Date
    let rateBuy: Float?
    let rateCross: Float?
    let rateSell: Float?
}

extension CurrencyRate: DatabaseConvertible {
    func toModel(context: Realm) -> RMCurrencyRate {
        .build { object in
            object.id = id
            object.currencyCodeA = currencyCodeA
            object.currencyCodeB = currencyCodeB
            object.date = date
            object.rateBuy = rateBuy
            object.rateCross = rateCross
            object.rateSell = rateSell
        }
    }
}
