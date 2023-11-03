//
//  UserAction.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import Foundation
import UIKit

// MARK: - UserAction

/// All available `User` module actions.
///
/// It's a type that represents all of the actions that can happen in `User` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum UserAction: Equatable {

    // MARK: - Cases

    /// The `onAppear` case represents an action when the user interface appears on the screen.
    case onAppear

    /// The `avatarResponse` case represents an action when a response is received after attempting to download a user's avatar image.
    /// The associated value is a `Result` type with a `UIImage?` representing the optional downloaded image and a `DownloadImageError` representing the possible error.
    case avatarResponse(Result<UIImage?, DownloadImageError>)
    
    // MARK: - Children
    
    /// The `favorite` case represents an action related to the "favorite" feature for a user.
    /// The associated value is a `FavoriteAction` representing the action performed in the context of the "favorite" feature.
    case favorite(FavoriteAction)
}
