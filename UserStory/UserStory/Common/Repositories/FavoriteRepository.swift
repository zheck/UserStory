//
//  FavoriteRepository.swift
//  UserStory
//
//  Created by Fong Zhou on 16/04/2025.
//

import Foundation

protocol FavoriteRepositoryProtocol {
    func add(id: String)
    func remove(id: String)
    func isFavorite(id: String) -> Bool
}

final class FavoriteRepository: FavoriteRepositoryProtocol {

    private let storage: LocalStorageProtocol
    private var favorites: [String]
    
    init(storage: LocalStorageProtocol = UserDefaults.standard) {
        self.storage = storage
        favorites = storage.object(for: .favorite) ?? []
    }
    
    func isFavorite(id: String) -> Bool {
        return favorites.contains(id)
    }
    
    func add(id: String) {
        favorites.append(id)
        synchronize()
    }
    func remove(id: String) {
        favorites.removeAll { $0 == id }
        synchronize()
    }
    
    private func synchronize() {
        storage.set(object: favorites, with: .favorite)
    }
}
