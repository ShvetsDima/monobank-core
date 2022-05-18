//
//  CurrencyService.swift
//  Monobank
//
//  Created by Dima Shvets on 11.05.2021.
//

import Foundation
import Combine
import Moya

final class CurrencyService: CurrencyUseCase {
    
    private let provider: Provider<CurrencyRateAPI>
    
    init(context: Context) {
        self.provider = context.network.provider()
    }
    
    func fetchRates() async -> Result<[CurrencyRate], DomainError> {
        return .success([])
    }
    
    private func sort(_ currencyRates: [CurrencyRate]) -> [CurrencyRate] {
        currencyRates.sorted {
            $0.rateBuy != nil && $0.rateSell != nil || $1.rateBuy != nil && $1.rateSell != nil
        }
    }
    
}
