//
//  DeferredTransitionState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
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
    public var isLoading = false

    /// True if navigation is active at the moment
    public var isNavigationActive: Bool {
        counter != nil
    }
    
    // MARK: - Children
    
    /// CounterState instance
    public var counter: CounterState?
}
