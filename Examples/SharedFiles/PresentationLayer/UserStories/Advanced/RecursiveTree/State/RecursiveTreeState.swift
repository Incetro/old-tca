//
//  RecursiveTreeState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import TCA
import Foundation

// MARK: - RecursiveTreeState

/// `RecursiveTree` module state
///
/// Basically, `RecursiveTreeState` is a type that describes the data
/// `RecursiveTree` feature needs to perform its logic and render its UI.
public struct RecursiveTreeState: Equatable, Identifiable {

    // MARK: - Properties

    /// Unique identifier
    public let id = UUID()

    /// Current item name
    public let name: String

    /// Children array
    public var children: IdentifiedArrayOf<RecursiveTreeState> = []
}

// MARK: - Random

extension RecursiveTreeState {

    private static let maxChildrenCount = 5

    static func random(childrenCount: Int = maxChildrenCount) -> RecursiveTreeState {
        RecursiveTreeState(
            name: childrenCount == maxChildrenCount ? "" : .generatedName,
            children: .init(
                (0..<childrenCount).map { _ in
                    .random(childrenCount: childrenCount - 1)
                }
            )
        )
    }
}
