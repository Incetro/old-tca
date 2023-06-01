//
//  LifecycleTimerAction.swift
//  verse-examples
//
//  Created by incetro on 16/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - LifecycleTimerAction

/// All available `LifecycleTimer` module actions.
///
/// It's a type that represents all of the actions that can happen in `LifecycleTimer` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum LifecycleTimerAction: Equatable {
    
    // MARK: - Children
    
    case timer(LifecycleAction<TimerAction>)
}
