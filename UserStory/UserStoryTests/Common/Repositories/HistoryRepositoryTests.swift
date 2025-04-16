//
//  HistoryRepositoryTests.swift
//  UserStoryTests
//
//  Created by Fong Zhou on 16/04/2025.
//

import Foundation
import XCTest
@testable import UserStory

class HistoryRepositoryTests: XCTestCase {
    
    private var storageMock: LocalStorageProtocolMock!

    override func setUp() {
        super.setUp()
        storageMock = .init()
    }

    override func tearDown() {
        storageMock = nil
        super.tearDown()
    }
    
    func test_isInHistory() {
        // GIVEN
        storageMock.objectTForKeyStorageKeyTReturnValue = ["1", "2"]
        let sut = HistoryRepository(storage: storageMock)
        
        // WHEN THEN
        XCTAssertTrue(sut.isInHistory(id: "1"))
        XCTAssertTrue(sut.isInHistory(id: "2"))
        XCTAssertFalse(sut.isInHistory(id: "3"))
    }
    
    func test_addToHistory() {
        // GIVEN
        storageMock.objectTForKeyStorageKeyTReturnValue = []
        let sut = HistoryRepository(storage: storageMock)
        
        // WHEN
        sut.add(id: "42")

        // THEN
        XCTAssertEqual(storageMock.setTObjectTWithStorageKeyVoidCallsCount, 1)
        XCTAssertEqual(storageMock.setTObjectTWithStorageKeyVoidReceivedArguments?.object as? [String], ["42"])
    }
}
