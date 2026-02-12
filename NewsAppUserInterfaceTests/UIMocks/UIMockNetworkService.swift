//
//  UIMockNetworkService.swift
//  NewsAppUserInterfaceTests
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import Foundation

final class UIMockNetworkService: NetworkProtocol {

    private let fixtureName: String

    init(fixtureName: String) {
        self.fixtureName = fixtureName
    }

    func request<T: Decodable>(
        url: URL,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        guard let fileURL = Bundle.main.url(forResource: fixtureName, withExtension: "json") else {
            DispatchQueue.main.async { completion(.failure(.noData)) }
            return
        }

        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(T.self, from: data)

            DispatchQueue.main.async { completion(.success(decoded)) }
        } catch {
            DispatchQueue.main.async { completion(.failure(.decoding(error))) }
        }
    }
}
