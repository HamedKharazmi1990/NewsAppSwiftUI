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
    
    func request<T: Decodable>(url: URL) async throws -> T {
            guard let fileURL = Bundle.main.url(forResource: fixtureName, withExtension: "json") else {
                throw NetworkError.noData
            }

            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                return try decoder.decode(T.self, from: data)
            } catch let err as NetworkError {
                throw err
            } catch {
                throw NetworkError.decoding(error)
            }
        }

//    func request<T: Decodable>(
//        url: URL,
//        completion: @escaping (Result<T, NetworkError>) -> Void
//    ) {
//        guard let fileURL = Bundle.main.url(forResource: fixtureName, withExtension: "json") else {
//            DispatchQueue.main.async { completion(.failure(.noData)) }
//            return
//        }
//
//        do {
//            let data = try Data(contentsOf: fileURL)
//            let decoder = JSONDecoder()
//            let decoded = try decoder.decode(T.self, from: data)
//
//            DispatchQueue.main.async { completion(.success(decoded)) }
//        } catch {
//            DispatchQueue.main.async { completion(.failure(.decoding(error))) }
//        }
//    }
}
