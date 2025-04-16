//
//  DetailViewModelTests.swift
//  UserStoryTests
//
//  Created by Fong Zhou on 16/04/2025.
//

import Foundation
import XCTest
@testable import UserStory

class DetailViewModelTests: XCTestCase {

    private var historyRepositoryMock: HistoryRepositoryProtocolMock!
    private var favoriteRepositoryMock: FavoriteRepositoryProtocolMock!
    private var story: UserStory = .init(id: "42", name: "42", photo: .dummy)

    override func setUp() {
        super.setUp()

        historyRepositoryMock = .init()
        favoriteRepositoryMock = .init()
        historyRepositoryMock.isInHistoryIdStringBoolReturnValue = false
        favoriteRepositoryMock.isFavoriteIdStringBoolReturnValue = false
    }

    override func tearDown() {
        historyRepositoryMock = nil
        favoriteRepositoryMock = nil
        super.tearDown()
    }
    
    func createSUT() -> DetailViewModel {
        return DetailViewModel(
            historyRepository: historyRepositoryMock,
            favoriteRepository: favoriteRepositoryMock,
            story: story
        )
    }
    
    func test_onAppear() {
        // GIVEN
        let sut = createSUT()
        
        // WHEN
        sut.onAppear()

        // THEN
        XCTAssertEqual(historyRepositoryMock.addIdStringVoidCallsCount, 1)
        XCTAssertEqual(historyRepositoryMock.addIdStringVoidReceivedId, "42")
    }

    func test_toggleAddFavorite() {
        // GIVEN
        favoriteRepositoryMock.isFavoriteIdStringBoolReturnValue = false
        let sut = createSUT()
        
        // WHEN
        sut.toggleFavorite()

        // THEN
        XCTAssertEqual(favoriteRepositoryMock.addIdStringVoidCallsCount, 1)
        XCTAssertEqual(favoriteRepositoryMock.addIdStringVoidReceivedId, "42")
    }
    
    func test_toggleRemoveFavorite() {
        // GIVEN
        favoriteRepositoryMock.isFavoriteIdStringBoolReturnValue = true
        let sut = createSUT()
        
        // WHEN
        sut.toggleFavorite()

        // THEN
        XCTAssertEqual(favoriteRepositoryMock.removeIdStringVoidCallsCount, 1)
        XCTAssertEqual(favoriteRepositoryMock.removeIdStringVoidReceivedId, "42")
    }
}
