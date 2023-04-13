//
//  InstantTransitionState.swift
//  verse-examples
//
//  Created by incetro on 08/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - InstantTransitionState

/// `InstantTransition` module state
///
/// Basically, `InstantTransitionState` is a type that describes the data
/// `InstantTransition` feature needs to perform its logic and render its UI.
public struct InstantTransitionState: Equatable {

    // MARK: - Properties

    /// CounterState instance
    var counter: CounterState?

    /// True if navigation is active at the moment
    var isNavigationActive = false
}
