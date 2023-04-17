//
//  EffectDebounceState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import Foundation

// MARK: - EffectDebounceState

/// `EffectDebounce` module state
///
/// Basically, `EffectDebounceState` is a type that describes the data
/// `EffectDebounce` feature needs to perform its logic and render its UI.
public struct EffectDebounceState: Equatable {

    // MARK: - Properties

    /// True if a request is being in flight
    public var isFactRequestInFlight = false

    /// Last obtained fact
    public var numberFact: String?
    
    // MARK: - Children
    
    /// CounterState instance
    public var counter = CounterState()
}
