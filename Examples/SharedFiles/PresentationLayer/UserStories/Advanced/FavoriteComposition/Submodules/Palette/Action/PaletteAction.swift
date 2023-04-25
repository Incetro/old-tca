//
//  PaletteAction.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import Foundation

// MARK: - PaletteAction

/// All available `Palette` module actions.
///
/// It's a type that represents all of the actions that can happen in `Palette` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum PaletteAction: Equatable {
    
    // MARK: - Cases
    
    /// The `favorite` case represents an action related to the "favorite" feature for a news article.
    /// The associated value is a `FavoriteAction` representing the action performed in the context of the "favorite" feature.
    case favorite(FavoriteAction)
}
