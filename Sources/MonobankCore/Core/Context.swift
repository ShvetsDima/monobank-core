//
//  Context.swift
//  Monobank
//
//  Created by Dima Shvets on 28.04.2021.
//

import Foundation
import Moya

final class Context {

    let environment: Environment
    let keychain: KeychainService
    let network: Network
    
    init(environment: Environment) {
        self.environment = environment
        self.keychain = KeychainService(environment.bundleID)
        self.network = Network(environment: environment, keychain: keychain)
    }

}
