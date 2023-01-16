//
//  DoubleCounterState.swift
//  verse-examples
//
//  Created by incetro on 13/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - DoubleCounterState

/// `DoubleCounter` module state
///
/// Basically, `DoubleCounterState` is a type that describes the data
/// `DoubleCounter` feature needs to perform its logic and render its UI.
public struct DoubleCounterState: Equatable {

    // MARK: - Properties

    var counter1 = CounterState()
    var counter2 = CounterState()
}
