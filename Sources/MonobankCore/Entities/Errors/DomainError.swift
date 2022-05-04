//
//  DomainError.swift
//  Monobank
//
//  Created by Dima Shvets on 07.07.2021.
//

import Foundation


public enum DomainError: LocalizedError {
    case database(Error)
    case network(Error)
    case uknown(Error)
}
