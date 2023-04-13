//
//  TimersState.swift
//  verse-examples
//
//  Created by incetro on 06/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - TimersState

/// `Timers` module state
///
/// Basically, `TimersState` is a type that describes the data
/// `Timers` feature needs to perform its logic and render its UI.
public struct TimersState: Equatable {

    // MARK: - Properties

    /// True if timer is active
    var isTimerActive = false

    /// Current progress value
    var progress: Double = 0
}
