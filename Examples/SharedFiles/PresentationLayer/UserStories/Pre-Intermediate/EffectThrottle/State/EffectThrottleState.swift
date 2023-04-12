//
//  EffectThrottleState.swift
//  verse-examples
//
//  Created by incetro on 15/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - EffectThrottleState

/// `EffectThrottle` module state
///
/// Basically, `EffectThrottleState` is a type that describes the data
/// `EffectThrottle` feature needs to perform its logic and render its UI.
public struct EffectThrottleState: Equatable {

    // MARK: - Properties

    /// CounterState instance
    public var counter = CounterState()

    /// True if a request is being in flight
    public var isFactRequestInFlight = false

    /// Last obtained fact
    public var numberFact: String?
}
