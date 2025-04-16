//
//  NetworkClient.swift
//  UserStory
//
//  Created by Fong Zhou on 16/04/2025.
//

import Foundation

public protocol NetworkClientProtocol {
    func fetch<T: Decodable>(url: URL) async throws -> T
}

final class NetworkClient: NetworkClientProtocol {
    
    private let sessionManager = URLSession.shared
    
    func fetch<T: Decodable>(url: URL) async throws -> T {
        let response = try await sessionManager.data(from: url)
        return try JSONDecoder().decode(T.self, from: response.0)
    }
}
