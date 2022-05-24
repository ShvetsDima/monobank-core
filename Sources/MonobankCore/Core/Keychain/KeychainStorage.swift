//
//  KeychainStorage.swift
//  Monobank
//
//  Created by Dima Shvets on 20.05.2021.
//

import Foundation
import KeychainAccess

protocol KeychainStorage {
	func value(for key: String) -> String?
	func set(value: String, for key: String)
	func removeValue(for key: String)
}

final class KeychainService: KeychainStorage {
	
	private let bundleID: String
	private let keychain: Keychain
	
	init(_ bundleID: String) {
		self.bundleID = bundleID
		self.keychain = Keychain(service: bundleID)
	}
	
	func value(for key: String) -> String? {
		keychain[key]
	}
	
	func set(value: String, for key: String) {
		keychain[key] = value
	}
	
	func removeValue(for key: String) {
		keychain[key] = nil
	}
}

extension KeychainService {
	enum Key: String {
		case token
	}
}
