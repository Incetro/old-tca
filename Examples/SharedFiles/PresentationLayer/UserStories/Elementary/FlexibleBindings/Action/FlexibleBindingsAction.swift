//
//  FlexibleBindingsAction.swift
//  verse-examples
//
//  Created by Nikita Lezya on 29/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation
import TCA

// MARK: - FlexibleBindingsAction

/// All available `FlexibleBindings` module actions.
///
/// It's a type that represents all of the actions that can happen in `FlexibleBindings` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum FlexibleBindingsAction: BindableAction, Equatable {
    
    /// Binding interlayer action
    ///
    /// Embeds a binding action in this action type.
    /// An action type that exposes a `binding` case that holds a `BindingAction`
    ///
    /// Used in conjunction with `BindableState` to safely eliminate the boilerplate typically
    /// associated with mutating multiple fields in state.
    ///
    /// See the documentation for `BindableState` for more details.
    case binding(BindingAction<FlexibleBindingsState>)
    
    /// Child action for `Counter` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `counter` case means that every action in `Counter` module
    /// will be sent to current module through it
    case counter(CounterAction)
    
    /// Resets controls state
    case resetControls
}
