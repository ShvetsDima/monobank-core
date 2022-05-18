//
//  RMCurrencyRate.swift
//  
//
//  Created by Dima Shvets on 10.05.2022.
//

import Foundation
import RealmSwift

@objcMembers
public class RMCurrencyRate: Object {
    
    dynamic var id: CurrencyRate.ID = ""
    dynamic var currencyCodeA: Int = 0
    dynamic var currencyCodeB: Int = 0
    dynamic var date: Date = Date()
    dynamic var rateBuy: Float?
    dynamic var rateCross: Float?
    dynamic var rateSell: Float?
    
    override public class func primaryKey() -> String? { return #keyPath(id) }
}

extension RMCurrencyRate: DomainConvertible {
    func toEntity() -> CurrencyRate {
        .init(currencyCodeA: currencyCodeA,
              currencyCodeB: currencyCodeB,
              date: date,
              rateBuy: rateBuy,
              rateCross: rateCross,
              rateSell: rateSell)
    }
}


