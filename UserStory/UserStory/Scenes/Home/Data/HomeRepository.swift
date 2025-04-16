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

protocol HomeRepositoryProtocol {
    func fetch(page: Int) async throws -> [UserStory]
}

final class HomeRepository: HomeRepositoryProtocol {
    let networkClient: NetworkClientProtocol
    
    init(networkClient: NetworkClientProtocol = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func fetch(page: Int) async throws -> [UserStory] {
        guard let url = URL(string: "https://file.notion.so/f/f/217d0d1c-7a97-42dd-91c5-2c6314c29174/56226368-cb1a-4572-a037-655366fc8071/users.json?table=block&id=1a0a0b48-1db4-8072-82db-c5aceda9f98d&spaceId=217d0d1c-7a97-42dd-91c5-2c6314c29174&expirationTimestamp=1744819690635&signature=bE-tzf1TWbCIocJAa1hKytrngWuROzc3LRXxF_BN28o&downloadName=users.json") else {
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
