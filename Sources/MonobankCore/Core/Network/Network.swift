//
//  Network.swift
//  Monobank
//
//  Created by Dima Shvets on 07.07.2021.
//

import Foundation
import Moya
import Combine

final class Network {
    
    private let environment: Environment
    private let plugins: [PluginType]
    
    init(environment: Environment, keychain: KeychainStorage) {
        self.environment = environment
        self.plugins = [AuthPlugin(keychain, environment), LogPlugin()]
    }
    
    func provider<Target: TargetType>()-> Provider<Target> {
        Provider(baseURL: environment.baseURL, plugins: plugins)
    }
    
}

final class Provider<Target: TargetType>: MoyaProvider<Target> {
    
    fileprivate init(baseURL: URL, plugins: [PluginType]) {
        super.init(endpointClosure: Provider.enpointClosure(baseURL), plugins: plugins)
    }
    
    func request(target: Target) async -> Result<Response, MoyaError> {
        return await withCheckedContinuation { continuation in
            super.request(target, completion: { completion in
                continuation.resume(returning: completion)
            })
        }
    }
    
    static func enpointClosure(_ baseURL: URL) -> (TargetType) -> Endpoint {
        { target in
            Endpoint(
                url: baseURL.appendingPathComponent(target.path).absoluteString,
                sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
            )
        }
    }
}

