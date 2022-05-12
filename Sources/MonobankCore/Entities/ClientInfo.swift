//
//  ClientInfo.swift
//  Monobank
//
//  Created by Dima Shvets on 06.05.2021.
//

import Foundation
import RealmSwift

public struct ClientInfo: Codable, Identifiable {
    public let id: String
    
    let name: String
    let webHookUrl: String
    var accounts: [Account]
}

extension ClientInfo: DatabaseConvertible {
    func toModel(context: Realm) -> RMClientInfo {
        .build { object in
            object.id = id
            object.name = name
            object.webHookUrl = webHookUrl
            object.accounts.append(objectsIn: accounts.map({
                $0.toModel(context: context)
            }))
        }
    }
}
