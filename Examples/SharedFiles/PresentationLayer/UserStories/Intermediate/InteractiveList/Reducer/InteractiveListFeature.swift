//
//  InteractiveListFeature.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import OldTCA
import Darwin
import Foundation

// MARK: - InteractiveListFeature

/// A `InteractiveList` module reducer
///
/// It's a function that describes how to evolve the current `InteractiveListState` to the next state given an action.
/// The `InteractiveListFeature` is also responsible for returning any effects that should be run, such as API requests,
/// which can be done by returning an `Effect` value
///
/// - Note: The thread on which effects output is important. An effect's output is immediately sent
///   back into the store, and `Store` is not thread safe. This means all effects must receive
///   values on the same thread, **and** if the `Store` is being used to drive UI then all output
///   must be on the main thread. You can use the `Publisher` method `receive(on:)` for make the
///   effect output its values on the thread of your choice.
public struct InteractiveListFeature: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public var body: some ReducerProtocol<InteractiveListState, InteractiveListAction> {
        Reduce { state, action in
            switch action {
            case .updateItems:
                state.items = .init(randomizeItems())
                return .none
            case .addRandom:
                state.items.insert(randomizeItem(index: state.items.count), at: 0)
                return .none
            case .removeCheckedItems:
                state.items.removeAll(where: \.isChecked)
                return .none
            case .delete(let offset):
                state.items.remove(atOffsets: offset)
                return .none
            case .item(id: _, action: .checkBoxToggled):
                struct ItemCheckingID: Hashable {}
                return Effect(value: InteractiveListAction.removeCheckedItems)
                    .debounce(
                        id: ItemCheckingID(),
                        for: 1,
                        scheduler: DispatchQueue.main.animation()
                    )
            }
        }.forEach(\.items, action: /InteractiveListAction.item(id:action:)) {
            InteractiveListItemFeature()
        }
    }
}

// MARK: - Private

private let colors = [
    "#033270",
    "#1368AA",
    "#4091C9",
    "#9DCEE2",
    "#FEDFD4",
    "#F29479",
    "#F26A4F",
    "#EF3C2D",
    "#CB1B16",
    "#65010C"
]

private let images = [
    "sun.max.fill",
    "heart.fill",
    "allergens",
    "hourglass"
]

private func randomizeItem(index: Int) -> InteractiveListItemState {
    InteractiveListItemState(
        id: UUID(),
        title: .generatedName,
        image: images.randomElement().unsafelyUnwrapped,
        color: colors[index % colors.count]
    )
}

private func randomizeItems() -> [InteractiveListItemState] {
    (0..<Int.random(in: 10...13)).map { index in
        randomizeItem(index: index)
    }
}
