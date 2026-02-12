//
//  NetworkServiceFactory.swift
//  NewsAppSwiftUI
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import Foundation

class NetworkServiceFactory {
    
    static func create<T: Decodable>(_ type: T.Type) -> NetworkProtocol {
        
        let environment = ProcessInfo.processInfo.environment["ENV"]
        if let environment = environment {
            if environment == "TEST" {
                let fixture = ProcessInfo.processInfo.environment["FIXTURE"] ?? "news"
                return UIMockNetworkService(fixtureName: fixture)
            } else {
                return Webservice()
            }
        }
        
        return Webservice()
    }
 
}
