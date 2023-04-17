//
//  SheetDeferredTransitionState.swift
//  verse-examples
//
//  Created by incetro on 10/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - SheetDeferredTransitionState

/// `SheetDeferredTransition` module state
///
/// Basically, `SheetDeferredTransitionState` is a type that describes the data
/// `SheetDeferredTransition` feature needs to perform its logic and render its UI.
public struct SheetDeferredTransitionState: Equatable {

    // MARK: - Properties

    /// True if we are in loading state
    var isLoading = false

    /// True if navigation is active at the moment
    var isSheetPresented: Bool {
        counter != nil
    }
    
    // MARK: - Children
    
    /// CounterState instance
    var counter: CounterState?
}
