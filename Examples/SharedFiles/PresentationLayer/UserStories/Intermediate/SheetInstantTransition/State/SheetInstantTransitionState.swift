//
//  SheetInstantTransitionState.swift
//  verse-examples
//
//  Created by incetro on 10/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
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
    var isSheetPresented = false
    
    // MARK: - Children
    
    /// CounterState instance
    var counter: CounterState?
}
