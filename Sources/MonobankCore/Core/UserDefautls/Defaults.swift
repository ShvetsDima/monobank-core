//
//  Defaults.swift
//  
//
//  Created by Dima Shvets on 24.05.2022.
//

import Foundation

protocol Defaults {
	func get<T>(for key: String) -> T?
	func get<T>(for key: String, default: T) -> T
	func set<T>(_ object: T, for key: String)
	func remove(for key: String)
}

final class UserDefaultsService: Defaults {

	// MARK: - Properties

	private let storage = UserDefaults.standard

	// MARK: - Storage

	func get<T>(for key: String) -> T? {
		return storage.object(forKey: key) as? T
	}

	func get<T>(for key: String, default: T) -> T {
		return get(for: key) ?? `default`
	}

	func set<T>(_ object: T, for key: String) {
		storage.set(object, forKey: key)
	}

	func remove(for key: String) {
		storage.removeObject(forKey: key)
	}
	
}



