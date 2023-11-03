//
//  SheetDeferredTransitionState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
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
    public var isLoading = false

    /// True if navigation is active at the moment
    public var isSheetPresented: Bool {
        counter != nil
    }
    
    // MARK: - Children
    
    /// CounterState instance
    public var counter: CounterState?
}
