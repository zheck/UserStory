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
    let hasSeen: Bool
    let isFavorite: Bool
}

final class HomeViewModel: ObservableObject {

    @Published private(set) var storyConfigs: [StoryConfig] = []
    @Published private(set) var error: Error? = nil
    
    private let homeRepository: HomeRepositoryProtocol
    private let historyRepository: HistoryRepositoryProtocol

    private var currentPage: Int = 0
    private var isLoading: Bool = false
    private var stories: [UserStory] = []
    
    init(
        homeRepository: HomeRepositoryProtocol = HomeRepository(),
        historyRepository: HistoryRepositoryProtocol = Dependencies.shared.historyRepository
    ) {
        self.homeRepository = homeRepository
        self.historyRepository = historyRepository
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
    
    func onAppear() {
        storyConfigs = stories.map { convert(story: $0) }
    }
    
    private func convert(story: UserStory) -> StoryConfig {
        return .init(
            id: story.id,
            description: story.name,
            image: story.photo,
            hasSeen: historyRepository.isInHistory(id: story.id),
            isFavorite: false
        )
    }
}
