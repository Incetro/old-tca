//
//  InstantTransitionState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import Foundation

// MARK: - InstantTransitionState

/// `InstantTransition` module state
///
/// Basically, `InstantTransitionState` is a type that describes the data
/// `InstantTransition` feature needs to perform its logic and render its UI.
public struct InstantTransitionState: Equatable {

    // MARK: - Properties

    /// True if navigation is active at the moment
    public var isNavigationActive = false
    
    // MARK: - Children
    
    /// CounterState instance
    public var counter: CounterState?
}
