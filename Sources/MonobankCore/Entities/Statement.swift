//
//  Statement.swift
//  Monobank
//
//  Created by Dima Shvets on 06.05.2021.
//

import Foundation
import RealmSwift

public struct Statement: Codable, Identifiable {
    public let id: String
    let time: Int
    let description: String
    let mcc: Int
    let hold: Bool
    let amount: Int
    let operationAmount: Int
    let currencyCode: Int
    let commissionRate: Int
    let cashbackAmount: Int
    let balance: Int
    let comment: String
    let receiptId: String
    let counterEdrpou: String
    let counterIban: String
}

extension Statement: DatabaseConvertible {
    func toModel(context: Realm) -> RMStatement {
        .build { object in
            object.id = id
            object.time = time
            object.statementDescription = description
            object.mcc = mcc
            object.hold = hold
            object.amount = amount
            object.operationAmount = operationAmount
            object.currencyCode = currencyCode
            object.commissionRate = commissionRate
            object.cashbackAmount = cashbackAmount
            object.balance = balance
            object.comment = comment
            object.receiptId = receiptId
            object.counterEdrpou = counterEdrpou
            object.counterIban = counterIban
        }
    }
}



