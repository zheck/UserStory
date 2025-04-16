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

    private let homeRepository: HomeRepositoryProtocol
    private var currentPage: Int = 0
    private var isLoading: Bool = false
    private var stories: [UserStory] = []

    @Published private(set) var storyConfigs: [StoryConfig] = []
    @Published private(set) var error: Error? = nil
    
    init(homeRepository: HomeRepositoryProtocol = HomeRepository()) {
        self.homeRepository = homeRepository
    }

    @MainActor
    func loadStories() async {
        guard !isLoading else { return }
        isLoading = true
        currentPage += 1
        do {
            let userStories = try await homeRepository.fetch(page: currentPage)
            isLoading = false

            let userStoryConfigs = userStories.map { convert(story: $0) }
            self.stories.append(contentsOf: userStories)
            self.storyConfigs.append(contentsOf: userStoryConfigs)
        } catch {
            isLoading = false
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
