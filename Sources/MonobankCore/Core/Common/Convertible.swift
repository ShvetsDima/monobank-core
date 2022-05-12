//
//  Convertible.swift
//  Monobank
//
//  Created by Dima Shvets on 19.07.2021.
//

import Foundation
import RealmSwift

protocol DomainConvertible {
    associatedtype EntityType
    func toEntity() -> EntityType
}
protocol DatabaseConvertible {
    associatedtype ModelType: DomainConvertible
    var id: String { get }
    func toModel(context: Realm) -> ModelType
}
