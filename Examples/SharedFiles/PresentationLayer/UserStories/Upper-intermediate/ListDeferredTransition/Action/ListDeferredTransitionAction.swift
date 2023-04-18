//
//  ListDeferredTransitionAction.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 18.04.2023.
//

import Foundation

// MARK: - ListDeferredTransitionAction

/// All available `ListDeferredTransition` module actions.
///
/// It's a type that represents all of the actions that can happen in `ListDeferredTransition` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum ListDeferredTransitionAction: Equatable {
    
    // MARK: - Cases
    
    /// An action that sets the navigation selection to the specified `UUID`.
    case setNavigation(selection: UUID?)
    
    /// An action that signals that loading has completed.
    case loadingCompleted(UUID)
    
    // MARK: - Children
    
    /// An action that updates the state of a counter associated with a row.
    case counter(CounterAction)
}
