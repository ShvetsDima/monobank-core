//
//  Account.swift
//  Monobank
//
//  Created by Dima Shvets on 06.05.2021.
//

import Foundation

public struct Account: Codable, Identifiable {
    public let id: String
    let balance: Int
    let creditLimit: Int
    let type: AccountType
    let currencyCode: Int
    let cashbackType: CashbackType
}

