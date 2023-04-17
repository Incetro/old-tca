//
//  SheetInstantTransitionState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import Foundation

// MARK: - SheetInstantTransitionState

/// `SheetInstantTransition` module state
///
/// Basically, `SheetInstantTransitionState` is a type that describes the data
/// `SheetInstantTransition` feature needs to perform its logic and render its UI.
public struct SheetInstantTransitionState: Equatable {

    // MARK: - Properties

    /// True if counter is being loaded
    public var isSheetPresented = false
    
    // MARK: - Children
    
    /// CounterState instance
    public var counter: CounterState?
}
