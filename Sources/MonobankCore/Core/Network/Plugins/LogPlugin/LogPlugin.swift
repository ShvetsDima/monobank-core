//
//  LogPlugin.swift
//  
//
//  Created by Dima Shvets on 10.05.2022.
//

import Foundation
import Moya

final class LogPlugin: PluginType {
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        #if DEBUG
        switch result {
        case .success(let body):
            print("Response: ")
            if let json = try? JSONSerialization.jsonObject(with: body.data, options: .mutableContainers) {
                print(json)
            } else {
                let response = String(data: body.data, encoding: .utf8)!
                print(response)
            }
        case .failure( _):
            break
        }
        #endif
    }
}
