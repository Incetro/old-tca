//
//  SimpleOptionalState.swift
//  TCA-examples
//
//  Created by incetro on 31/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - SimpleOptionalState

/// `SimpleOptional` module state
///
/// Basically, `SimpleOptionalState` is a type that describes the data
/// `SimpleOptional` feature needs to perform its logic and render its UI.
public struct SimpleOptionalState: Equatable {

    // MARK: - Properties
    
    /// Auxillary property for counter state description
    public var counterDescription: String {
        "Counter is " + (counter == nil ? "nil" : "non-nil")
    }
    
    // MARK: - Children
    
    /// Optional CounterState instance
    public var counter: CounterState? = CounterState()
}
