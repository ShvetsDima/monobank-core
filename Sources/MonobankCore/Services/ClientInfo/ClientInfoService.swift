//
//  ClientInfoService.swift
//  
//
//  Created by Dima Shvets on 02.05.2022.
//

import Foundation
import Combine
import Moya

final class ClientInfoService: ClientInfoUseCase {

    private let provider: Provider<ClientInfoAPI>
    
    init(context: Context) {
        self.provider = context.network.provider()
    }
    
//    func fetchClientInfo() async -> Result<ClientInfo, DomainError> {
// 
//    }
    
}
