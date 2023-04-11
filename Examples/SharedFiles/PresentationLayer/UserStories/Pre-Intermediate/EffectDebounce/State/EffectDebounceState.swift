//
//  EffectDebounceState.swift
//  verse-examples
//
//  Created by incetro on 15/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - EffectDebounceState

/// `EffectDebounce` module state
///
/// Basically, `EffectDebounceState` is a type that describes the data
/// `EffectDebounce` feature needs to perform its logic and render its UI.
public struct EffectDebounceState: Equatable {

    // MARK: - Properties

    /// CounterState instance
    public var counter = CounterState()

    /// True if a request is being in flight
    public var isFactRequestInFlight = false

    /// Last obtained fact
    public var numberFact: String?
}
