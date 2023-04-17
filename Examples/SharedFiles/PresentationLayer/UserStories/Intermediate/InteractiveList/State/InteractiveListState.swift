//
//  InteractiveListState.swift
//  verse-examples
//
//  Created by incetro on 08/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA

// MARK: - InteractiveListState

/// `InteractiveList` module state
///
/// Basically, `InteractiveListState` is a type that describes the data
/// `InteractiveList` feature needs to perform its logic and render its UI.
public struct InteractiveListState: Equatable {

    // MARK: - Properties

    public var items: IdentifiedArrayOf<InteractiveListItemState> = []
}
