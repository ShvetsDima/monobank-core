//
//  Result+AsyncFlatMap.swift
//  
//
//  Created by Dima Shvets on 18.05.2022.
//

import Foundation

extension Result {
	func asyncFlatMap<T>(_ transform:(Success) async -> T) async -> Result<T, DomainError> {
		switch self {
		case let .success(success):
			return await .success(transform(success))
		case let .failure(error):
			if let domainError = error as? DomainError {
				return .failure(domainError)
			} else {
				return .failure(DomainError.uknown(error))
			}
		}
	}
}

