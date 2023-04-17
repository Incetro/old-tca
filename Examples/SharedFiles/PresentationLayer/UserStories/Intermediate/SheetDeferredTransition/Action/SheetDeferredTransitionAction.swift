//
//  SheetDeferredTransitionAction.swift
//  verse-examples
//
//  Created by incetro on 10/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - SheetDeferredTransitionAction

/// All available `SheetDeferredTransition` module actions.
///
/// It's a type that represents all of the actions that can happen in `SheetDeferredTransition` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum SheetDeferredTransitionAction: Equatable {
    
    // MARK: - Cases
    
    /// An action that sets whether the sheet is currently presented.
    /// - Parameters:
    ///   - isPresented: A boolean value indicating whether the sheet is presented or not.
    case setSheet(isPresented: Bool)
    
    /// An action that signals that loading has completed for the sheet.
    case loadingCompleted
    
    // MARK: - Children
    
    /// An action that performs a counter action on the sheet.
    case counter(CounterAction)
}

