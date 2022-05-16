//
//  Database.swift
//  
//
//  Created by Dima Shvets on 12.05.2022.
//

import Foundation

protocol Database {
    func fetch<T: DatabaseConvertible>(where predicate: NSPredicate?,
                                       sorted descriptors: [NSSortDescriptor]) async -> [T] where T == T.ModelType.EntityType
    func save<T: DatabaseConvertible>(entities: [T]) async where T == T.ModelType.EntityType
    func delete<T: DatabaseConvertible>(entities: [T]) async where T == T.ModelType.EntityType
    func truncate() async
}
