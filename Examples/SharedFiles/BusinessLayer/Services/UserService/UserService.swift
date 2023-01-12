//
//  UserService.swift
//  verse-swiftui-examples
//
//  Created by incetro on 11/13/21.
//

import Combine
import Foundation

// MARK: - UserService

public protocol UserService {

    /// Update some user's isStarred state
    /// - Returns: result publisher
    func refresh(userID: Int, isStarred: Bool) -> AnyPublisher<Bool, Error>
}
