//
//  DeferredTransitionState.swift
//  verse-examples
//
//  Created by incetro on 08/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - DeferredTransitionState

/// `DeferredTransition` module state
///
/// Basically, `DeferredTransitionState` is a type that describes the data
/// `DeferredTransition` feature needs to perform its logic and render its UI.
public struct DeferredTransitionState: Equatable {

    // MARK: - Properties

    /// True if we are in loading state
    var isLoading = false

    /// True if navigation is active at the moment
    var isNavigationActive: Bool {
        counter != nil
    }
    
    // MARK: - Children
    
    /// CounterState instance
    var counter: CounterState?
}
