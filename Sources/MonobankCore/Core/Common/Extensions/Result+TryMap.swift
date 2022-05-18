//
//  Result+TryMap.swift
//  
//
//  Created by Dima Shvets on 18.05.2022.
//

import Foundation

extension Result {
	func tryMap<T>(_ transform:(Success) throws -> T) -> Result<T, DomainError> {
		switch self {
		case let .success(success):
			do {
				return .success(try transform(success))
			} catch {
				return .failure(DomainError.mapping(error))
			}
		case let .failure(error):
			if let domainError = error as? DomainError {
				return .failure(domainError)
			} else {
				return .failure(DomainError.uknown(error))
			}
		}
	}
}
