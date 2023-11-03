//
//  EffectThrottleAction.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import Foundation
import OldTCA

// MARK: - EffectThrottleAction

/// All available `EffectThrottle` module actions.
///
/// It's a type that represents all of the actions that can happen in `EffectThrottle` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum EffectThrottleAction: Equatable {
    
    /// Generates fact for the current number
    case generateFact
    
    /// An action that calls when user taps on the `randomFact` button
    /// Cancels fact request
    case cancelButtonTapped
    
    /// Responce of the `NumberFactService` generation method
    case numberFactResponse(TaskResult<String>)
    
    // MARK: - Children
    
    /// Child action for `Counter` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `counter` case means that every action in `Counter` module
    /// will be sent to current module through it
    case counter(CounterAction)
}
