//
//  RMStatement.swift
//  
//
//  Created by Dima Shvets on 10.05.2022.
//

import Foundation
import RealmSwift

@objcMembers
public class RMStatement: Object {
    
    dynamic var id: Statement.ID = ""
    dynamic var time: Int = 0
    dynamic var statementDescription: String = ""
    dynamic var mcc: Int = 0
    dynamic var hold: Bool = false
    dynamic var amount: Int = 0
    dynamic var operationAmount: Int = 0
    dynamic var currencyCode: Int = 0
    dynamic var commissionRate: Int = 0
    dynamic var cashbackAmount: Int = 0
    dynamic var balance: Int = 0
    dynamic var comment: String = ""
    dynamic var receiptId: String = ""
    dynamic var counterEdrpou: String = ""
    dynamic var counterIban: String = ""
    
    override public class func primaryKey() -> String? { return #keyPath(id) }
}

extension RMStatement: DomainConvertible {
    func toEntity() -> Statement {
        .init(id: id,
              time: time,
              description: statementDescription,
              mcc: mcc,
              hold: hold,
              amount: amount,
              operationAmount: operationAmount,
              currencyCode: currencyCode,
              commissionRate: commissionRate,
              cashbackAmount: cashbackAmount,
              balance: balance,
              comment: comment,
              receiptId: receiptId,
              counterEdrpou: counterEdrpou,
              counterIban: counterIban)
    }
}

