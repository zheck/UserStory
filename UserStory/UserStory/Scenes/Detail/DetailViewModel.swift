//
//  DetailViewModel.swift
//  UserStory
//
//  Created by Fong Zhou on 16/04/2025.
//

import Foundation

final class DetailViewModel {

    private let historyRepository: HistoryRepositoryProtocol
    private let storyId: String
    
    init(
        historyRepository: HistoryRepositoryProtocol = Dependencies.shared.historyRepository,
        storyId: String
    ) {
        self.historyRepository = historyRepository
        self.storyId = storyId
    }
    
    func onAppear() {
        historyRepository.add(id: storyId)
    }
    
}
