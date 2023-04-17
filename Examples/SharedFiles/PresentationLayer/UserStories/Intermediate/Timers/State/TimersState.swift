//
//  TimersState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
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
    public var isTimerActive = false

    /// Current progress value
    public var progress: Double = 0
}
