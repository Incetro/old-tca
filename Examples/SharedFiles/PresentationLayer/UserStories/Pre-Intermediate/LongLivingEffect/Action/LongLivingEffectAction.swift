//
//  LongLivingEffectAction.swift
//  verse-examples
//
//  Created by incetro on 22/02/2022.
//  Copyright © 2022 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - LongLivingEffectAction

/// All available `LongLivingEffect` module actions.
///
/// It's a type that represents all of the actions that can happen in `LongLivingEffect` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum LongLivingEffectAction: Equatable {

    // MARK: - Cases

    /// Represents an action that triggers when a view or screen appears on the user's device screen
    case onAppear
    
    /// Represents an action that triggers when a view or screen disappears from the user's device screen
    case onDisappear
    
    /// Represents an action that triggers when the user takes a screenshot of the app's content
    case userDidTakeScreenshot
}
