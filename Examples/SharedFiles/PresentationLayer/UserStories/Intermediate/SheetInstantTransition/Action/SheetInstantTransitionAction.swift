//
//  SheetInstantTransitionAction.swift
//  verse-examples
//
//  Created by incetro on 10/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - SheetInstantTransitionAction

/// All available `SheetInstantTransition` module actions.
///
/// It's a type that represents all of the actions that can happen in `SheetInstantTransition` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum SheetInstantTransitionAction: Equatable {
    case counter(CounterAction)
    case setSheet(isPresented: Bool)
    case loadingCompleted
}