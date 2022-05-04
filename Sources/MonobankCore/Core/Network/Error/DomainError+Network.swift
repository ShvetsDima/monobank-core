//
//  DomainError+Network.swift
//  Monobank
//
//  Created by Dima Shvets on 07.07.2021.
//

import Foundation
import Moya

extension DomainError {
    init(_ moyaError: MoyaError) {
        self = .network(moyaError)
    }
}
