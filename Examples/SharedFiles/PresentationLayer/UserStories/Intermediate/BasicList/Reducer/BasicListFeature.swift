//
//  BasicListFeature.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import TCA
import Darwin
import Foundation

// MARK: - BasicListFeature

public struct BasicListFeature: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public var body: some ReducerProtocol<BasicListState, BasicListAction> {
        Reduce { state, action in
            switch action {
            case .updateItems:
                state.items = randomizeItems()
            case .addRandom:
                state.items.insert(randomizeItem(index: state.items.count), at: 0)
            }
            return .none
        }
    }
}

// MARK: - Private

private let colors = [
    "#4361ee",
    "#2ec4b6",
    "#e71d36",
    "#ff9f1c"
]

private let images = [
    "sun.max.fill",
    "heart.fill",
    "allergens",
    "hourglass"
]

private func randomizeItem(index: Int) -> BasicListState.Item {
    BasicListState.Item(
        id: UUID(),
        title: .generatedName,
        image: images[index % images.count],
        color: colors[index % colors.count]
    )
}

private func randomizeItems() -> [BasicListState.Item] {
    (0..<Int.random(in: 7...13)).map { index in
        randomizeItem(index: index)
    }
}
