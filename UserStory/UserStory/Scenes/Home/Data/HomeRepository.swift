//
//  HomeRepository.swift
//  UserStory
//
//  Created by Fong Zhou on 16/04/2025.
//

import Foundation

enum ServiceError: Error {
    case invalidURL
}

// sourcery: AutoMockable
protocol HomeRepositoryProtocol {
    func fetch(page: Int) async throws -> [UserStory]
}

final class HomeRepository: HomeRepositoryProtocol {
    let networkClient: NetworkClientProtocol
    
    init(networkClient: NetworkClientProtocol = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func fetch(page: Int) async throws -> [UserStory] {
        guard let url = Bundle.main.url(forResource: "home", withExtension: "json") else {
            throw ServiceError.invalidURL
        }
        let result: HomeResponseDTO = try await networkClient.fetch(url: url)
        return result.pages.flatMap {
            $0.users.map { convert(userStoryDTO: $0, page: page) }
        }
    }
    
    private func convert(userStoryDTO: UserStoryDTO, page: Int) -> UserStory {
        return .init(
            id: "\(page)-\(userStoryDTO.id)",
            name: userStoryDTO.name,
            photo: userStoryDTO.profile_picture_url
        )
    }
}
