//
//  AuthPlugin.swift
//  Monobank
//
//  Created by Dima Shvets on 20.05.2021.
//

import Foundation
import Moya

final class AuthPlugin: PluginType {
    private let keychain: KeychainService
    private let environment: Environment
        
    init(_ keychain: KeychainService, _ environment: Environment) {
        self.keychain = keychain
        self.environment = environment
    }
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard target.needAuth else { return request }
        var updatedRequest = request
        let token = keychain.value(for: environment.tokenKey)
        updatedRequest.setValue(token, forHTTPHeaderField: environment.authorizationHeader)
        return updatedRequest
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        #if DEBUG
        switch result {
        case .success(let body):
            print("Response:")
            if let json = try? JSONSerialization.jsonObject(with: body.data, options: .mutableContainers) {
                print(json)
            } else {
                let response = String(data: body.data, encoding: .utf8)!
                print(response)
            }
        case .failure( _):
            break
        }
        #endif
    }
}
