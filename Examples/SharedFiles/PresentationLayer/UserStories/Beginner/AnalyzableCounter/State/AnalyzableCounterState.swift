//
//  AnalyzableCounterState.swift
//  verse-examples
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

    /// Current value
    var counter = CounterState()

    /// Maximum tracked value
    var max = 0

    /// Min tracked value
    var min = 0

    /// Counter events count
    var eventsCount = 0
}
