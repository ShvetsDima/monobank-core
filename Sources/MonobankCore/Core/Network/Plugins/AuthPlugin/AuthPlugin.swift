//
//  AuthPlugin.swift
//  Monobank
//
//  Created by Dima Shvets on 20.05.2021.
//

import Foundation
import Moya

final class AuthPlugin: PluginType {
	
	private let authHeader = "X-Token"
	
    private let keychain: KeychainStorage
    private let environment: Environment
        
    init(_ keychain: KeychainStorage, _ environment: Environment) {
        self.keychain = keychain
        self.environment = environment
    }
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard target.needAuth else { return request }
        var updatedRequest = request
		let token = keychain.value(for: KeychainService.Key.token.rawValue)
        updatedRequest.setValue(token, forHTTPHeaderField: authHeader)
        return updatedRequest
    }
}
