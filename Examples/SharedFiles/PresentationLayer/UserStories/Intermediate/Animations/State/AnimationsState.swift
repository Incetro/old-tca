//
//  AnimationsState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
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
