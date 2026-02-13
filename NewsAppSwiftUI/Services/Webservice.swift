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
    
    func request<T: Decodable>(url: URL) async throws -> T {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)

                guard let http = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }

                guard (200...299).contains(http.statusCode) else {
                    throw NetworkError.badRequest(statusCode: http.statusCode)
                }

                guard !data.isEmpty else {
                    throw NetworkError.noData
                }

                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw NetworkError.decoding(error)
                }

            } catch let error as NetworkError {
                throw error
            } catch {
                throw NetworkError.transport(error)
            }
        }

}
