//
//  EffectThrottleState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import Foundation

// MARK: - EffectThrottleState

/// `EffectThrottle` module state
///
/// Basically, `EffectThrottleState` is a type that describes the data
/// `EffectThrottle` feature needs to perform its logic and render its UI.
public struct EffectThrottleState: Equatable {

    // MARK: - Properties

    /// True if a request is being in flight
    public var isFactRequestInFlight = false

    /// Last obtained fact
    public var numberFact: String?
    
    // MARK: - Children
    
    /// CounterState instance
    public var counter = CounterState()
}
