//
//  ListDeferredTransitionState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 18.04.2023.
//

import OldTCA
import Foundation

// MARK: - ListDeferredTransitionState

/// `ListDeferredTransition` module state
///
/// Basically, `ListDeferredTransitionState` is a type that describes the data
/// `ListDeferredTransition` feature needs to perform its logic and render its UI.
public struct ListDeferredTransitionState: Equatable {

    // MARK: - Item

    public struct Item: Equatable, Identifiable {

        // MARK: - Properties

        /// A unique identifier generated using `UUID()`.
        public let id = UUID()

        /// A string representing a color.
        public let color: String

        /// A string representing a title.
        public let title: String

        /// An integer representing a count.
        public var count: Int
        
        /// Indicates if module is loading
        public var isLoading = false
    }

    // MARK: - Properties
    
    /// An array of identified `Item` objects, allowing for identifier-based access.
    public var items: IdentifiedArrayOf<Item>
    
    /// An optional identified object containing an `Item.ID` identifier and a `CounterState` object.
    /// Used to represent the currently selected row.
    public var selection: Identified<Item.ID, CounterState?>?
    
    // MARK: - Initializer
    
    public init() {
        self.items = IdentifiedArrayOf(
            uniqueElements: [
                Item(color: "e63946", title: .generatedName, count: 1),
                Item(color: "f1faee", title: .generatedName, count: 7),
                Item(color: "a8dadc", title: .generatedName, count: 13),
                Item(color: "457b9d", title: .generatedName, count: 100),
                Item(color: "1d3557", title: .generatedName, count: 777)
            ]
        )
    }
}
