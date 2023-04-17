//
//  InteractiveListState.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
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
