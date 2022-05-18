//
//  AuthenticationService.swift
//  
//
//  Created by Dima Shvets on 22.01.2022.
//

import Foundation

final class AuthenticationService: AuthenticationUseCase {
    
    private let context: Context
    
    init(context: Context) {
        self.context = context
    }
    
    var authenticationURL: URL { context.environment.baseURL }
    
    func authenticateWith(_ token: String) {
        context.keychain.set(value: token, for: context.environment.tokenKey)
    }
}
