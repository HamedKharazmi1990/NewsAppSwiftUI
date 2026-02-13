//
//  MockNetworkService.swift
//  NewsAppUnitTests
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import Foundation

final class MockNetworkService<T: Decodable>: NetworkProtocol {

    var result: Result<T, NetworkError>!

    func request<U: Decodable>(url: URL) async throws -> U {
            guard let result = result as? Result<U, NetworkError> else {
                throw NetworkError.decoding(NSError(domain: "Mock type mismatch", code: 0))
            }
            return try result.get()
        }
}
