//
//  Context.swift
//  Monobank
//
//  Created by Dima Shvets on 28.04.2021.
//

import Foundation

final class Context {

    let environment: Environment
    let keychain: KeychainStorage
	let debouncer: Debouncer
    let network: Network
    let database: Database
    
    init(environment: Environment) {
        self.environment = environment
        self.keychain = KeychainService(environment.bundleID)
		self.debouncer = DebounceService()
        self.network = Network(environment: environment, keychain: keychain)
        self.database = RealmDatabase(bundleID: environment.bundleID)
    }

}
