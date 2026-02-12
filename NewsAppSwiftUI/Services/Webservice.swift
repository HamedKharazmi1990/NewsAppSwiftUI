//
//  Webservice.swift
//  NewsAppSwiftUI
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import Foundation

enum NetworkError: Error {
    case badRequest(statusCode: Int)
    case transport(Error)              // URLSession error
    case decoding(Error)               // JSONDecoder error
    case invalidResponse
    case noData

    var message: String {
        switch self {
        case .badRequest(let code):
            return "\(Constants.Messages.requestFailed): \(code)"
        case .transport(let error):
            return "\(Constants.Messages.networkError): \(error.localizedDescription)"
        case .decoding:
            return Constants.Messages.decodingError
        case .invalidResponse:
            return Constants.Messages.invalidResponse
        case .noData:
            return Constants.Messages.noData
        }
    }
}

final class Webservice: NetworkProtocol {

    func request<T: Decodable>(
        url: URL,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                completion(.failure(.transport(error)))
                return
            }

            guard let http = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }

            guard (200...299).contains(http.statusCode) else {
                completion(.failure(.badRequest(statusCode: http.statusCode)))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.decoding(error)))
            }

        }.resume()
    }
}
