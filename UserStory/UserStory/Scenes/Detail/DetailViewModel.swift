//
//  DetailViewModel.swift
//  UserStory
//
//  Created by Fong Zhou on 16/04/2025.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {

    private let historyRepository: HistoryRepositoryProtocol
    private let favoriteRepository: FavoriteRepositoryProtocol
    private let story: UserStory
    
    @Published var isFavorite: Bool
    private(set) var imageURL: URL
    
    init(
        historyRepository: HistoryRepositoryProtocol = Dependencies.shared.historyRepository,
        favoriteRepository: FavoriteRepositoryProtocol = Dependencies.shared.favoriteRepository,
        story: UserStory
    ) {
        self.historyRepository = historyRepository
        self.favoriteRepository = favoriteRepository
        self.story = story
        self.isFavorite = favoriteRepository.isFavorite(id: story.id)
        self.imageURL = story.photo
    }
    
    func onAppear() {
        historyRepository.add(id: story.id)
    }

    func toggleFavorite() {
        isFavorite ? favoriteRepository.remove(id: story.id) : favoriteRepository.add(id: story.id)
        isFavorite.toggle()
    }
}
