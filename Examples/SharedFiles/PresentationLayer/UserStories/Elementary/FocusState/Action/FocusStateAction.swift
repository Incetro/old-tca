//
//  FocusStateAction.swift
//  TCA-examples
//
//  Created by incetro on 16/02/2022.
//  Copyright © 2022 Incetro Inc. All rights reserved.
//

import OldTCA
import Foundation

// MARK: - FocusStateAction

/// All available `FocusState` module actions.
///
/// It's a type that represents all of the actions that can happen in `FocusState` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum FocusStateAction: BindableAction, Equatable {

    // MARK: - Cases

    /// An action that calls when user taps on the `next` button
    /// This action changes current focused field property
    case nextButtonTapped
    
    /// An action that calls when user taps on the `action` button
    /// Confirmation of the registration process
    case actionButtonTapped
    
    /// An action that calls when user taps on the `next` button
    /// This action fills all fields with random data
    case fillRandomDataButtonTapped
    
    /// An action that calls when user taps on the `hide/show` button in the password field
    case togglePasswordButtonTapped
    
    /// Binding interlayer action
    ///
    /// Embeds a binding action in this action type.
    /// An action type that exposes a `binding` case that holds a `BindingAction`
    ///
    /// Used in conjunction with `BindableState` to safely eliminate the boilerplate typically
    /// associated with mutating multiple fields in state.
    ///
    /// See the documentation for `BindableState` for more details.
    case binding(BindingAction<FocusStateState>)
    
    /// An action that calls when user taps on the `dismiss` button on the alert
    case alertDismissed
}
