//
//  RealmDatabase.swift
//  
//
//  Created by Dima Shvets on 12.05.2022.
//

import Foundation
import RealmSwift

final class RealmDatabase: Database {
    
    private let configuration: Realm.Configuration
    
    init(bundleID: String, configuration: Realm.Configuration = .defaultConfiguration) {
        self.configuration = configuration
    }
    
    func fetch<T: DatabaseConvertible>(where predicate: NSPredicate? = nil,
									   sorted descriptors: [NSSortDescriptor]) async -> [T] where T == T.ModelType.EntityType {
        return await withCheckedContinuation({ [weak self] continuation in
            self?.read { realm in
                var objects = realm.objects(T.ModelType.self)
                if let filterPredicate = predicate {
                    objects = objects.filter(filterPredicate)
                }
                if !descriptors.isEmpty {
                    objects = objects.sorted(by: descriptors.map({ .init(keyPath: $0.key ?? "", ascending: $0.ascending) }))
                }
                let entities = Array(objects.map({ $0.toEntity() }))
                continuation.resume(with: .success(entities))
            }
        })
    }
    
    func save<T: DatabaseConvertible>(entities: [T]) async where T == T.ModelType.EntityType {
        return await withCheckedContinuation({ [weak self] continuation in
            self?.write { realm in
                let objects = entities.compactMap({ $0.toModel(context: realm) as? Object })
                realm.add(objects, update: .modified)
                continuation.resume()
            }
        })
    }
    
    func delete<T: DatabaseConvertible>(entities: [T]) async where T == T.ModelType.EntityType {
        return await withCheckedContinuation({ [weak self] continuation in
            self?.write { realm in
                let objects = entities.compactMap({ $0.toModel(context: realm) as? Object })
                realm.delete(objects)
                continuation.resume()
            }
        })
    }
    
    func truncate() async {
        return await withCheckedContinuation({ [weak self] continuation in
            self?.write { realm in
                realm.deleteAll()
                continuation.resume()
            }
        })
    }
    
    private func write(_ operation: @escaping (Realm) -> Void) {
        do {
            let realm = try Realm(configuration: configuration)
            if realm.isInWriteTransaction {
                operation(realm)
            } else {
                try realm.write {
                    operation(realm)
                }
            }
        } catch {
            print(error)
        }
    }
    
    private func read(_ operation: @escaping (Realm) -> Void) {
        do {
            let realm = try Realm(configuration: configuration)
            operation(realm)
        } catch {
            print(error)
        }
    }
}
