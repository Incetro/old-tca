//
//  FavoriteAction.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import Foundation

// MARK: - FavoriteAction

/// All available `Favorite` module actions.
///
/// It's a type that represents all of the actions that can happen in `Favorite` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum FavoriteAction: Equatable {
    
    // MARK: - Cases

    /// The `alertDismissed` case represents an action when an alert related to the "favorite" feature is dismissed by the user.
    case alertDismissed

    /// The `favoriteButtonTapped` case represents an action when the user taps the "favorite" button.
    case favoriteButtonTapped

    /// The `response` case represents an action when a response is received after the "favorite" operation is performed.
    /// The associated value is a `Result` type with a `Bool` representing the success status and a `FavoriteError` representing the possible error.
    case response(Result<Bool, FavoriteError>)
}

// MARK: - FavoriteError

/// A wrapper for errors that occur when favoriting
public struct FavoriteError: Equatable, Error, Identifiable {

    // MARK: - Properties

    /// Occurred error
    public let error: NSError

    /// Error description
    public var localizedDescription: String {
        error.localizedDescription
    }

    /// Error unique id
    public var id: String {
        error.localizedDescription
    }

    /// Comparator
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
