//
//  RMClientInfo.swift
//  
//
//  Created by Dima Shvets on 10.05.2022.
//

import Foundation
import RealmSwift

@objcMembers
public class RMClientInfo: Object {
    
    dynamic var id: ClientInfo.ID = ""
    dynamic var name: String = ""
    dynamic var webHookUrl: String = ""
    var accounts = List<RMAccount>()
    
    override public class func primaryKey() -> String? { return #keyPath(id) }
}

extension RMClientInfo: DomainConvertible {
    func toEntity() -> ClientInfo {
        .init(id: id,
              name: name,
              webHookUrl: webHookUrl,
              accounts: accounts.map({$0.toEntity()}))
    }
}
