//
//  Account.swift
//  Monobank
//
//  Created by Dima Shvets on 06.05.2021.
//

import Foundation
import RealmSwift

public struct Account: Codable, Identifiable {
    public let id: String
    let balance: Int
    let creditLimit: Int
    let type: AccountType
    let currencyCode: Int
    let cashbackType: CashbackType
}

extension Account: DatabaseConvertible {
    func toModel(context: Realm) -> RMAccount {
        .build { object in
            object.id = id
            object.balance = balance
            object.creditLimit = creditLimit
            object.type = type.rawValue
            object.currencyCode = currencyCode
            object.cashbackType = cashbackType.rawValue
        }
    }
}

