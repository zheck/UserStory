//
//  Dependencies.swift
//  UserStory
//
//  Created by Fong Zhou on 16/04/2025.
//

import Foundation

struct Dependencies {
    
    static let shared = Dependencies()

    let historyRepository: HistoryRepositoryProtocol = HistoryRepository()

    private init() {}
}
