//
//  FibonacciCounterState.swift
//  verse-examples
//
//  Created by incetro on 02/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - FibonacciCounterState

/// `FibonacciCounter` module state
///
/// Basically, `FibonacciCounterState` is a type that describes the data
/// `FibonacciCounter` feature needs to perform its logic and render its UI.
public struct FibonacciCounterState: Equatable {

    // MARK: - Properties

    /// ❌ when current value is not fibonacci number,
    /// ✅ otherwise
    var fibonacchiText = "❌"

    /// CounterState instance
    var counter = CounterState()
}
