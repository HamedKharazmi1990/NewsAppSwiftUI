//
//  NetworkProtocol.swift
//  NewsAppSwiftUI
//
//  Created by Hamed Kharazmi on 12.02.26.
//

import Foundation

protocol NetworkProtocol {
    func request<T: Decodable>(url: URL) async throws -> T
}
