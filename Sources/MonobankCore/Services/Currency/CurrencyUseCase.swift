//
//  CurrencyUseCase.swift
//  
//
//  Created by Dima Shvets on 23.02.2022.
//

import Foundation

public protocol CurrencyUseCase: AutoUseCaseProvider {
    func fetchRates() async -> Result<[CurrencyRate], DomainError>
}

