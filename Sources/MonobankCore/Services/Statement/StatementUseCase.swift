//
//  StatementUseCase.swift
//  
//
//  Created by Dima Shvets on 03.05.2022.
//

import Foundation

public protocol StatementUseCase: AutoUseCaseProvider {
    func fetchStatements(for account: Account, from: Date, to: Date) async -> Result<[Statement], DomainError>
}
