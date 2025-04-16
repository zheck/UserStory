//
//  FavoriteRepositoryTests.swift
//  UserStoryTests
//
//  Created by Fong Zhou on 16/04/2025.
//

import Foundation
import XCTest
@testable import UserStory

class FavoriteRepositoryTests: XCTestCase {
    
    private var storageMock: LocalStorageProtocolMock!

    override func setUp() {
        super.setUp()
        storageMock = .init()
    }

    override func tearDown() {
        storageMock = nil
        super.tearDown()
    }
    
    func test_isFavorite() {
        // GIVEN
        storageMock.objectTForKeyStorageKeyTReturnValue = ["1", "2"]
        let sut = FavoriteRepository(storage: storageMock)
        
        // WHEN THEN
        XCTAssertTrue(sut.isFavorite(id: "1"))
        XCTAssertTrue(sut.isFavorite(id: "2"))
        XCTAssertFalse(sut.isFavorite(id: "3"))
    }
    
    func test_addFavorite() {
        // GIVEN
        storageMock.objectTForKeyStorageKeyTReturnValue = []
        let sut = FavoriteRepository(storage: storageMock)
        
        // WHEN
        sut.add(id: "42")

        // THEN
        XCTAssertEqual(storageMock.setTObjectTWithStorageKeyVoidCallsCount, 1)
        XCTAssertEqual(storageMock.setTObjectTWithStorageKeyVoidReceivedArguments?.object as? [String], ["42"])
    }
    
    func test_removeFavorite() {
        // GIVEN
        storageMock.objectTForKeyStorageKeyTReturnValue = ["43"]
        let sut = FavoriteRepository(storage: storageMock)
        
        // WHEN
        sut.remove(id: "43")

        // THEN
        XCTAssertEqual(storageMock.setTObjectTWithStorageKeyVoidCallsCount, 1)
        XCTAssertEqual(storageMock.setTObjectTWithStorageKeyVoidReceivedArguments?.object as? [String], [])
    }
}
