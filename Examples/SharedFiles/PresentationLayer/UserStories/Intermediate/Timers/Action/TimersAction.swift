//
//  TimersAction.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import Foundation

// MARK: - TimersAction

/// All available `Timers` module actions.
///
/// It's a type that represents all of the actions that can happen in `Timers` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
// Define a Swift enumeration called TimersAction
public enum TimersAction: Equatable {
    
    // MARK: - Cases
    
    // This case represents a timer tick event
    case timerTick
    
    // This case represents a button tap event related to timers
    case timerButtonTapped
    
    // This case represents an onDisappear event related to timers
    case onDisappear
}

