//
//  AnimationsState.swift
//  verse-examples
//
//  Created by incetro on 06/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - AnimationsState

/// `Animations` module state
///
/// Basically, `AnimationsState` is a type that describes the data
/// `Animations` feature needs to perform its logic and render its UI.
public struct AnimationsState: Equatable {

    // MARK: - Properties

    /// Current animation progress
    public var progress: Double = 0.13
}
