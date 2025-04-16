// Generated using Sourcery 2.2.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif


@testable import UserStory






















class FavoriteRepositoryProtocolMock: FavoriteRepositoryProtocol {




    //MARK: - add

    var addIdStringVoidCallsCount = 0
    var addIdStringVoidCalled: Bool {
        return addIdStringVoidCallsCount > 0
    }
    var addIdStringVoidReceivedId: (String)?
    var addIdStringVoidReceivedInvocations: [(String)] = []
    var addIdStringVoidClosure: ((String) -> Void)?

    func add(id: String) {
        addIdStringVoidCallsCount += 1
        addIdStringVoidReceivedId = id
        addIdStringVoidReceivedInvocations.append(id)
        addIdStringVoidClosure?(id)
    }

    //MARK: - remove

    var removeIdStringVoidCallsCount = 0
    var removeIdStringVoidCalled: Bool {
        return removeIdStringVoidCallsCount > 0
    }
    var removeIdStringVoidReceivedId: (String)?
    var removeIdStringVoidReceivedInvocations: [(String)] = []
    var removeIdStringVoidClosure: ((String) -> Void)?

    func remove(id: String) {
        removeIdStringVoidCallsCount += 1
        removeIdStringVoidReceivedId = id
        removeIdStringVoidReceivedInvocations.append(id)
        removeIdStringVoidClosure?(id)
    }

    //MARK: - isFavorite

    var isFavoriteIdStringBoolCallsCount = 0
    var isFavoriteIdStringBoolCalled: Bool {
        return isFavoriteIdStringBoolCallsCount > 0
    }
    var isFavoriteIdStringBoolReceivedId: (String)?
    var isFavoriteIdStringBoolReceivedInvocations: [(String)] = []
    var isFavoriteIdStringBoolReturnValue: Bool!
    var isFavoriteIdStringBoolClosure: ((String) -> Bool)?

    func isFavorite(id: String) -> Bool {
        isFavoriteIdStringBoolCallsCount += 1
        isFavoriteIdStringBoolReceivedId = id
        isFavoriteIdStringBoolReceivedInvocations.append(id)
        if let isFavoriteIdStringBoolClosure = isFavoriteIdStringBoolClosure {
            return isFavoriteIdStringBoolClosure(id)
        } else {
            return isFavoriteIdStringBoolReturnValue
        }
    }


}
class HistoryRepositoryProtocolMock: HistoryRepositoryProtocol {




    //MARK: - add

    var addIdStringVoidCallsCount = 0
    var addIdStringVoidCalled: Bool {
        return addIdStringVoidCallsCount > 0
    }
    var addIdStringVoidReceivedId: (String)?
    var addIdStringVoidReceivedInvocations: [(String)] = []
    var addIdStringVoidClosure: ((String) -> Void)?

    func add(id: String) {
        addIdStringVoidCallsCount += 1
        addIdStringVoidReceivedId = id
        addIdStringVoidReceivedInvocations.append(id)
        addIdStringVoidClosure?(id)
    }

    //MARK: - isInHistory

    var isInHistoryIdStringBoolCallsCount = 0
    var isInHistoryIdStringBoolCalled: Bool {
        return isInHistoryIdStringBoolCallsCount > 0
    }
    var isInHistoryIdStringBoolReceivedId: (String)?
    var isInHistoryIdStringBoolReceivedInvocations: [(String)] = []
    var isInHistoryIdStringBoolReturnValue: Bool!
    var isInHistoryIdStringBoolClosure: ((String) -> Bool)?

    func isInHistory(id: String) -> Bool {
        isInHistoryIdStringBoolCallsCount += 1
        isInHistoryIdStringBoolReceivedId = id
        isInHistoryIdStringBoolReceivedInvocations.append(id)
        if let isInHistoryIdStringBoolClosure = isInHistoryIdStringBoolClosure {
            return isInHistoryIdStringBoolClosure(id)
        } else {
            return isInHistoryIdStringBoolReturnValue
        }
    }


}
class HomeRepositoryProtocolMock: HomeRepositoryProtocol {




    //MARK: - fetch

    var fetchPageIntUserStoryThrowableError: (any Error)?
    var fetchPageIntUserStoryCallsCount = 0
    var fetchPageIntUserStoryCalled: Bool {
        return fetchPageIntUserStoryCallsCount > 0
    }
    var fetchPageIntUserStoryReceivedPage: (Int)?
    var fetchPageIntUserStoryReceivedInvocations: [(Int)] = []
    var fetchPageIntUserStoryReturnValue: [UserStory]!
    var fetchPageIntUserStoryClosure: ((Int) async throws -> [UserStory])?

    func fetch(page: Int) async throws -> [UserStory] {
        fetchPageIntUserStoryCallsCount += 1
        fetchPageIntUserStoryReceivedPage = page
        fetchPageIntUserStoryReceivedInvocations.append(page)
        if let error = fetchPageIntUserStoryThrowableError {
            throw error
        }
        if let fetchPageIntUserStoryClosure = fetchPageIntUserStoryClosure {
            return try await fetchPageIntUserStoryClosure(page)
        } else {
            return fetchPageIntUserStoryReturnValue
        }
    }


}
class LocalStorageProtocolMock: LocalStorageProtocol {




    //MARK: - object<T>

    var objectTForKeyStorageKeyTCallsCount = 0
    var objectTForKeyStorageKeyTCalled: Bool {
        return objectTForKeyStorageKeyTCallsCount > 0
    }
    var objectTForKeyStorageKeyTReceivedKey: (StorageKey)?
    var objectTForKeyStorageKeyTReceivedInvocations: [(StorageKey)] = []
    var objectTForKeyStorageKeyTReturnValue: Any?
    var objectTForKeyStorageKeyTClosure: ((StorageKey) -> Any?)?

    func object<T>(for key: StorageKey) -> T? {
        objectTForKeyStorageKeyTCallsCount += 1
        objectTForKeyStorageKeyTReceivedKey = key
        objectTForKeyStorageKeyTReceivedInvocations.append(key)
        if let objectTForKeyStorageKeyTClosure = objectTForKeyStorageKeyTClosure {
            return objectTForKeyStorageKeyTClosure(key) as? T
        } else {
            return objectTForKeyStorageKeyTReturnValue as? T
        }
    }

    //MARK: - set<T>

    var setTObjectTWithStorageKeyVoidCallsCount = 0
    var setTObjectTWithStorageKeyVoidCalled: Bool {
        return setTObjectTWithStorageKeyVoidCallsCount > 0
    }
    var setTObjectTWithStorageKeyVoidReceivedArguments: (object: Any, with: StorageKey)?
    var setTObjectTWithStorageKeyVoidReceivedInvocations: [(object: Any, with: StorageKey)] = []
    var setTObjectTWithStorageKeyVoidClosure: ((Any, StorageKey) -> Void)?

    func set<T>(object: T, with: StorageKey) {
        setTObjectTWithStorageKeyVoidCallsCount += 1
        setTObjectTWithStorageKeyVoidReceivedArguments = (object: object, with: with)
        setTObjectTWithStorageKeyVoidReceivedInvocations.append((object: object, with: with))
        setTObjectTWithStorageKeyVoidClosure?(object, with)
    }


}
public class NetworkClientProtocolMock: NetworkClientProtocol {

    public init() {}



    //MARK: - fetch<T: Decodable>

    public var fetchTDecodableUrlURLTThrowableError: (any Error)?
    public var fetchTDecodableUrlURLTCallsCount = 0
    public var fetchTDecodableUrlURLTCalled: Bool {
        return fetchTDecodableUrlURLTCallsCount > 0
    }
    public var fetchTDecodableUrlURLTReceivedUrl: (URL)?
    public var fetchTDecodableUrlURLTReceivedInvocations: [(URL)] = []
    public var fetchTDecodableUrlURLTReturnValue: Any!
    public var fetchTDecodableUrlURLTClosure: ((URL) async throws -> Any)?

    public func fetch<T: Decodable>(url: URL) async throws -> T {
        fetchTDecodableUrlURLTCallsCount += 1
        fetchTDecodableUrlURLTReceivedUrl = url
        fetchTDecodableUrlURLTReceivedInvocations.append(url)
        if let error = fetchTDecodableUrlURLTThrowableError {
            throw error
        }
        if let fetchTDecodableUrlURLTClosure = fetchTDecodableUrlURLTClosure {
            return try await fetchTDecodableUrlURLTClosure(url) as! T
        } else {
            return fetchTDecodableUrlURLTReturnValue as! T
        }
    }


}
