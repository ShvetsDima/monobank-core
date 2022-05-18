//
//  RMAccount.swift
//  
//
//  Created by Dima Shvets on 10.05.2022.
//

import Foundation
import RealmSwift

@objcMembers
public class RMAccount: Object {
    
    dynamic var id: Account.ID = ""
    dynamic var balance: Int = 0
    dynamic var creditLimit: Int = 0
    dynamic var type: String = ""
    dynamic var currencyCode: Int = 0
    dynamic var cashbackType: String = ""
    
    override public class func primaryKey() -> String? { return #keyPath(id) }
}

extension RMAccount: DomainConvertible {
    func toEntity() -> Account {
        .init(id: id,
              balance: balance,
              creditLimit: creditLimit,
              type: AccountType(rawValue: type) ?? .black,
              currencyCode: currencyCode,
              cashbackType: CashbackType(rawValue: cashbackType) ?? .none)
    }
}
