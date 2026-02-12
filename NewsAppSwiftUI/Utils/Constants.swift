//
//  Constants.swift
//  NewsAppSwiftUI
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import Foundation

struct Constants {
    
    static let baseURL = URL(string: "https://newsapi.org/v2")!
    
    struct Urls {
            static func newsByApiKey(apiKey: String, country: String = "us") -> URL {
                var components = URLComponents(url: baseURL.appendingPathComponent("top-headlines"),
                                               resolvingAgainstBaseURL: false)!
                components.queryItems = [
                    URLQueryItem(name: "country", value: country),
                    URLQueryItem(name: "apiKey", value: apiKey)
                ]
                return components.url!
            }
        }
    
    struct Messages {
        static let requestFailed = "Request failed with status code"
        static let networkError = "Network error"
        static let decodingError = "Failed to decode JSON"
        static let invalidResponse = "Invalid server response"
        static let noData = "No data received"
    }
}
