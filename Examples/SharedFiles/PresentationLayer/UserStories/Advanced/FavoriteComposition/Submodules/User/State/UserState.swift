//
//  UserState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import OldTCA
import SwiftUI
import Foundation

// MARK: - UserState

/// `User` module state
///
/// Basically, `UserState` is a type that describes the data
/// `User` feature needs to perform its logic and render its UI.
@dynamicMemberLookup
public struct UserState: Equatable, Identifiable {

    // MARK: - Properties

    /// Unique identifier
    public var id: Int {
        user.id
    }

    /// User instance
    public var user: User

    /// User's avatar
    public var avatar: Image?

    /// True if avatar loading is in progress
    public var isAvatarLoading = false

    /// Alert state
    public var alert: AlertState<FavoriteAction>?

    /// FavoriteState instance
    public var favorite: FavoriteState<ID> {
        get {
            .init(
                alert: alert,
                id: id,
                isFavorite: user.isStarred,
                selectedImageName: "star.fill",
                unselectedImageName: "star"
            )
        }
        set {
            (alert, user.isStarred) = (newValue.alert, newValue.isFavorite)
        }
    }

    // MARK: - DynamicMemberLookup

    public subscript<Dependency>(dynamicMember keyPath: KeyPath<User, Dependency>) -> Dependency {
        user[keyPath: keyPath]
    }
}
