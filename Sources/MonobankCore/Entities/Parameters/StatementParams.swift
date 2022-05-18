//
//  StatementParams.swift
//  
//
//  Created by Dima Shvets on 02.05.2022.
//

import Foundation

struct StatementParams: Codable {
    let account: Account.ID
    let from: Double
    let to: Double
}


