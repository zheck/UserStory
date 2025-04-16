//
//  HistoryRepository.swift
//  UserStory
//
//  Created by Fong Zhou on 16/04/2025.
//

import Foundation

protocol HistoryRepositoryProtocol {
    func add(id: String)
    func isInHistory(id: String) -> Bool
}

final class HistoryRepository: HistoryRepositoryProtocol {

    private let storage: LocalStorageProtocol
    private var history: Set<String>
    
    init(storage: LocalStorageProtocol = UserDefaults.standard) {
        self.storage = storage
        history = storage.object(for: .history) ?? []
    }
    
    func isInHistory(id: String) -> Bool {
        return history.contains(id)
    }
    
    func add(id: String) {
        history.insert(id)
        storage.set(object: Array(history), with: .history)
    }
}
