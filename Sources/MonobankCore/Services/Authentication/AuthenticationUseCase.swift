//
//  AuthenticationUseCase.swift
//  
//
//  Created by Dima Shvets on 20.01.2022.
//

import Foundation

public protocol AuthenticationUseCase: AutoUseCaseProvider {
    var authenticationURL: URL { get }
    func authenticateWith(_ token: String)
}
