//
//  CurrencyService.swift
//  Monobank
//
//  Created by Dima Shvets on 11.05.2021.
//

import Foundation
import Moya

final class CurrencyService: CurrencyUseCase {
	
	private let provider: Provider<CurrencyRateAPI>
	private let database: Database
	
	init(context: Context) {
		self.provider = context.network.provider()
		self.database = context.database
	}
	
	func fetchRates() async -> Result<[CurrencyRate], DomainError> {
		return .success([])
	}
	
	private func refresh(_ currencyRates: [CurrencyRate]) async -> Result<Void, DomainError> {
		await provider
			.request(target: .currencies)
			.mapError(DomainError.init)
			.tryMap { try $0.map([CurrencyRate].self) }
			.asyncFlatMap(database.save(entities:))
	}
	
	private func sort(_ currencyRates: [CurrencyRate]) -> [CurrencyRate] {
		currencyRates.sorted {
			$0.rateBuy != nil && $0.rateSell != nil || $1.rateBuy != nil && $1.rateSell != nil
		}
	}
	
}
