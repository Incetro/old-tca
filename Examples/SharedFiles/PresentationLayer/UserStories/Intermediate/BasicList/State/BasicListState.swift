//
//  BasicListState.swift
//  verse-examples
//
//  Created by incetro on 08/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - BasicListState

/// `BasicList` module state
///
/// Basically, `BasicListState` is a type that describes the data
/// `BasicList` feature needs to perform its logic and render its UI.
public struct BasicListState: Equatable {

    // MARK: - Item

    public struct Item: Identifiable, Equatable {

        // MARK: - Properties

        /// Unique identifier
        public let id: UUID

        /// Title value
        public let title: String

        /// Image name
        public let image: String

        /// Hex color
        public let color: String
    }

    // MARK: - Properties

    public var items: [Item] = []
}
