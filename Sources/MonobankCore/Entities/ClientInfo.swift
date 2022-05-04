//
//  ClientInfo.swift
//  Monobank
//
//  Created by Dima Shvets on 06.05.2021.
//

import Foundation

public struct ClientInfo: Codable, Identifiable {
    public let id: String
    
    let name: String
    let webHookUrl: String
    let accounts: [Account]
}
