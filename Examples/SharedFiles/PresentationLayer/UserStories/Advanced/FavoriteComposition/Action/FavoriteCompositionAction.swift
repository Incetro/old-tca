//
//  FavoriteCompositionAction.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import Foundation

// MARK: - FavoriteCompositionAction

/// All available `FavoriteComposition` module actions.
///
/// It's a type that represents all of the actions that can happen in `FavoriteComposition` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum FavoriteCompositionAction: Equatable {
    
    // MARK: - Cases
    
    /// The `palette` case represents an action when the user interacts with a palette in the context of the "favorite" feature.
    /// The associated values are a `PaletteState.ID` representing the identifier of the palette and a `PaletteAction` representing the action performed.
    case palette(id: PaletteState.ID, action: PaletteAction)

    /// The `user` case represents an action when the user interacts with a user profile in the context of the "favorite" feature.
    /// The associated values are a `UserState.ID` representing the identifier of the user and a `UserAction` representing the action performed.
    case user(id: UserState.ID, action: UserAction)

    /// The `book` case represents an action when the user interacts with a book in the context of the "favorite" feature.
    /// The associated values are a `BookState.ID` representing the identifier of the book and a `BookAction` representing the action performed.
    case book(id: BookState.ID, action: BookAction)

    /// The `news` case represents an action when the user interacts with a news article in the context of the "favorite" feature.
    /// The associated values are a `NewsState.ID` representing the identifier of the news article and a `NewsAction` representing the action performed.
    case news(id: NewsState.ID, action: NewsAction)
}
