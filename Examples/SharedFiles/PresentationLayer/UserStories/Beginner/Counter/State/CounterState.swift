//
//  CounterState.swift
//  verse-swiftui-examples
//
//  Created by incetro on 10/13/21.
//

import Foundation

// MARK: - CounterState

/// `Counter` module state
///
/// Basically, `CounterState` is a type that describes the data
/// `Counter` feature needs to perform its logic and render its UI.
public struct CounterState: Equatable {

    // MARK: - Properties

    /// Counter value
    public var count = 0
}
