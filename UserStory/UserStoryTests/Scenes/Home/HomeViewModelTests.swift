//
//  HomeViewModelTests.swift
//  UserStoryTests
//
//  Created by Fong Zhou on 16/04/2025.
//

import Foundation
import XCTest
@testable import UserStory

extension URL {
    static let dummy = URL(string: "www.google.com")!
}

class HomeViewModelTests: XCTestCase {

    private var homeRepositoryMock: HomeRepositoryProtocolMock!
    private var historyRepositoryMock: HistoryRepositoryProtocolMock!
    private var favoriteRepositoryMock: FavoriteRepositoryProtocolMock!

    override func setUp() {
        super.setUp()

        homeRepositoryMock = .init()
        historyRepositoryMock = .init()
        favoriteRepositoryMock = .init()
        historyRepositoryMock.isInHistoryIdStringBoolReturnValue = false
        favoriteRepositoryMock.isFavoriteIdStringBoolReturnValue = false
    }

    override func tearDown() {
        homeRepositoryMock = nil
        historyRepositoryMock = nil
        favoriteRepositoryMock = nil
        super.tearDown()
    }
    
    func createSUT() -> HomeViewModel {
        return HomeViewModel(
            homeRepository: homeRepositoryMock,
            historyRepository: historyRepositoryMock,
            favoriteRepository: favoriteRepositoryMock
        )
    }
    
    func test_loadStories_ok() async {
        // GIVEN
        homeRepositoryMock.fetchPageIntUserStoryReturnValue = [
            .init(id: "42", name: "42", photo: .dummy),
            .init(id: "43", name: "43", photo: .dummy)
        ]
        let sut = createSUT()
        
        // WHEN
        await sut.loadStories()

        // THEN
        XCTAssertTrue(homeRepositoryMock.fetchPageIntUserStoryCalled)
        XCTAssertEqual(sut.storyConfigs.count, 2)
    }

    func test_loadStories_ko() async {
        // GIVEN
        homeRepositoryMock.fetchPageIntUserStoryThrowableError = ServiceError.invalidURL
        let sut = createSUT()
        
        // WHEN
        await sut.loadStories()

        // THEN
        XCTAssertTrue(homeRepositoryMock.fetchPageIntUserStoryCalled)
        XCTAssertEqual(sut.error as? ServiceError, ServiceError.invalidURL)
        XCTAssertTrue(sut.storyConfigs.isEmpty)
    }
}
