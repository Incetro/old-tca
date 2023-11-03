//
//  DoubleCounterState.swift
//  TCA-examples
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

    /// `CounterState` instance
    ///
    /// It's an instance of `counter` submodule.
    /// We use it here to be able to integrate `counter` feature into a current module logic.
    /// All necessary processing is placed inside current reducer. Also, if you change the state
    /// inside the `counter` module all changes will be saved here.
    public var counter1 = CounterState()
    
    /// `CounterState` instance
    ///
    /// It's an instance of `counter` submodule.
    /// We use it here to be able to integrate `counter` feature into a current module logic.
    /// All necessary processing is placed inside current reducer. Also, if you change the state
    /// inside the `counter` module all changes will be saved here.
    public var counter2 = CounterState()
}
