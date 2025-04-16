//
//  LocalStorage.swift
//  UserStory
//
//  Created by Fong Zhou on 16/04/2025.
//

import Foundation

enum StorageKey: String {
    case history
    case favorite
}

protocol LocalStorageProtocol {
    func object<T>(for key: StorageKey) -> T?
    func set<T>(object: T, with: StorageKey)
}

extension UserDefaults: LocalStorageProtocol {
    func object<T>(for key: StorageKey) -> T? {
        return object(forKey: key.rawValue) as? T
    }
    func set<T>(object: T, with key: StorageKey) {
        set(object, forKey: key.rawValue)
        synchronize()
    }
}
