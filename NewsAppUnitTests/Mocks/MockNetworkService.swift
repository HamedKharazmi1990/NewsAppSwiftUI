//
//  MockNetworkService.swift
//  NewsAppUnitTests
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import Foundation

final class MockNetworkService<T: Decodable>: NetworkProtocol {

    var result: Result<T, NetworkError>!

    func request<U: Decodable>(
        url: URL,
        completion: @escaping (Result<U, NetworkError>) -> Void
    ) {
        guard let result = result as? Result<U, NetworkError> else {
            completion(.failure(.decoding(NSError(domain: "Mock type mismatch", code: 0))))
            return
        }
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
