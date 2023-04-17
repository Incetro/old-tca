//
//  AnimationsAction.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import Foundation

// MARK: - AnimationsAction

/// All available `Animations` module actions.
///
/// It's a type that represents all of the actions that can happen in `Animations` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum AnimationsAction: Equatable {
    
    // MARK: - Cases
    
    /// Indicates if random progress button tapped
    case randomProgressButtonTapped
}
