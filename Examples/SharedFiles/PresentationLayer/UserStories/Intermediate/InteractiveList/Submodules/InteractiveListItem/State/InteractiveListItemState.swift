//
//  InteractiveListItemState.swift
//  verse-examples
//
//  Created by incetro on 09/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - InteractiveListItemState

/// `InteractiveListItem` module state
///
/// Basically, `InteractiveListItemState` is a type that describes the data
/// `InteractiveListItem` feature needs to perform its logic and render its UI.
public struct InteractiveListItemState: Identifiable, Equatable {

    // MARK: - Properties

    /// Unique identifier
    public let id: UUID

    /// Title value
    public let title: String

    /// Image name
    public let image: String

    /// Hex color
    public let color: String

    /// True if current item is checked
    public var isChecked = false
}
