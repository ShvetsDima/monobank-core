// Generated using Sourcery 1.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

public protocol HasAuthenticationUseCase {
    var authentication: AuthenticationUseCase { get }
}

public typealias UseCases =
    HasAuthenticationUseCase

public protocol UseCasesProvider: UseCases {}
