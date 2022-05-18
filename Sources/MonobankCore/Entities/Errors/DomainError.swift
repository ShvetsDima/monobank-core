//
//  DomainError.swift
//  Monobank
//
//  Created by Dima Shvets on 07.07.2021.
//

import Foundation

public enum DomainError: Error {
	case database(Error)
	case network(Error)
	case mapping(Error)
	case uknown(Error)
}

extension DomainError: Equatable {
	public static func == (lhs: Self, rhs: Self) -> Bool {
		switch (lhs, rhs) {
		case (.network(let lhsError), .network(let rhsError)):
			return ErrorUtility.areEqual(lhsError, rhsError)
		case (.database(let lhsError), .database(let rhsError)):
			return ErrorUtility.areEqual(lhsError, rhsError)
		case (.mapping(let lhsError), .mapping(let rhsError)):
			return ErrorUtility.areEqual(lhsError, rhsError)
		case (.uknown(let lhsError), .uknown(let rhsError)):
			return ErrorUtility.areEqual(lhsError, rhsError)
		default: return false
		}
	}
}


final class ErrorUtility {
	public static func areEqual(_ lhs: Error, _ rhs: Error) -> Bool {
		lhs.reflectedString == rhs.reflectedString
	}
}

extension Error {
	var reflectedString: String {
		String(reflecting: self)
	}
	
	func isEqual(to: Self) -> Bool {
		reflectedString == to.reflectedString
	}
}

extension NSError {
	func isEqual(to: NSError) -> Bool {
		let lhs = self as Error
		let rhs = to as Error
		return isEqual(to) && lhs.reflectedString == rhs.reflectedString
	}
}

