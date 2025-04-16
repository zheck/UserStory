//
//  HistoryRepository.swift
//  UserStory
//
//  Created by Fong Zhou on 16/04/2025.
//

import Foundation

// sourcery: AutoMockable
protocol HistoryRepositoryProtocol {
    func add(id: String)
    func isInHistory(id: String) -> Bool
}

final class HistoryRepository: HistoryRepositoryProtocol {

    private let storage: LocalStorageProtocol
    private var history: [String]
    
    init(storage: LocalStorageProtocol = UserDefaults.standard) {
        self.storage = storage
        history = storage.object(for: .history) ?? []
    }
    
    func isInHistory(id: String) -> Bool {
        return history.contains(id)
    }
    
    func add(id: String) {
        history.append(id)
        storage.set(object: Array(history), with: .history)
    }
}
