//
//  StatementService.swift
//  
//
//  Created by Dima Shvets on 03.05.2022.
//

import Foundation
import Combine
import Moya

final class StatementService: StatementUseCase {
    
    private let provider: Provider<StatementAPI>
    
    init(context: Context) {
        self.provider = context.network.provider()
    }
    
    func fetchStatements(for account: Account, from: Date, to: Date) async -> Result<[Statement], DomainError> {
        return .success([])
    }
    
}


