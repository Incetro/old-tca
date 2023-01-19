//
//  ScramblerState.swift
//  TCA-examples
//
//  Created by incetro on 10/12/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - ScramblerState

/// `Scrambler` module state
///
/// Basically, `ScramblerState` is a type that describes the data
/// `Scrambler` feature needs to perform its logic and render its UI.
public struct ScramblerState: Equatable {

    // MARK: - Properties

    /// Current scramble string
    public var scramble: String?

    /// Current scramble moves count
    public var currentScrambleLength = 10
}
