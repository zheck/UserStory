//
//  HomeViewModel.swift
//  UserStory
//
//  Created by Fong Zhou on 16/04/2025.
//

import Foundation

struct StoryConfig: Equatable {
    let id: String
    let description: String
    let image: URL
}

final class HomeViewModel: ObservableObject {

    let homeRepository: HomeRepositoryProtocol
    @Published private(set) var storyConfigs: [StoryConfig] = []
    @Published private(set) var error: Error? = nil
    
    init(homeRepository: HomeRepositoryProtocol = HomeRepository()) {
        self.homeRepository = homeRepository
    }

    @MainActor
    func loadStories() async {
        do {
            let stories = try await homeRepository.fetch()
            storyConfigs = stories.map { convert(story: $0) }
        } catch {
            self.error = error
        }
    }
    
    private func convert(story: UserStory) -> StoryConfig {
        return .init(
            id: story.id,
            description: story.name,
            image: story.photo
        )
    }
}
