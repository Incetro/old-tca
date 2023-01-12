//
//  User.swift
//  verse-swiftui-examples
//
//  Created by incetro on 11/14/21.
//

import Foundation

// MARK: - User

public struct User: Equatable {

    // MARK: - Properties

    /// Unique identifier
    public let id: Int

    /// User's name
    public let name: String

    /// User's nickname
    public let username: String

    /// User's avatar URL
    public let avatarURL: URL

    /// True if current user has been starred
    public var isStarred = false
}
