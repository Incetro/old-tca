//
//  CounterAction.swift
//  verse-swiftui-examples
//
//  Created by incetro on 10/13/21.
//

import Foundation

// MARK: - CounterAction

/// All available `Counter` module actions.
///
/// It's a type that represents all of the actions that can happen in `Counter` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum CounterAction: Equatable {
    case decrementButtonTapped
    case incrementButtonTapped
}
