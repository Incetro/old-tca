//
//  MainState.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Foundation

// MARK: - MainState

/// `Main` module state
///
/// Basically, `MainState` is a type that describes the data
/// `Main` feature needs to perform its logic and render its UI.
public struct MainState: Equatable {

    // MARK: - Properties
    
    /// CounterState instance
    public var counter = CounterState(count: 13)
    
    /// DoubleCounterState instance
    public var doubleCounter = DoubleCounterState()
    
    /// AnalyzableCounterState instance
    public var analyzableCounter = AnalyzableCounterState()
    
    /// FibonacciCounterState instance
    public var fibonacciCounter = FibonacciCounterState()
    
    /// ScramblerState instance
    public var scrambler = ScramblerState()
}