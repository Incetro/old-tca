//
//  AnalyzableCounterState.swift
//  TCA-examples
//
//  Created by incetro on 02/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - AnalyzableCounterState

/// `AnalyzableCounter` module state
///
/// Basically, `AnalyzableCounterState` is a type that describes the data
/// `AnalyzableCounter` feature needs to perform its logic and render its UI.
public struct AnalyzableCounterState: Equatable {

    // MARK: - Properties
    
    /// `CounterState` instance
    ///
    /// It's an instance of `Counter` submodule.
    /// We use it here to be able to integrate `Counter` feature into a current module logic.
    /// All necessary processing is placed inside current reducer. Also, if you change the state
    /// inside the `Counter` module all changes will be saved here.
    public var counter = CounterState()

    /// Maximum tracked value
    public var max = 0

    /// Min tracked value
    public var min = 0

    /// Counter events count
    public var eventsCount = 0
}
