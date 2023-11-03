//
//  ListDeferredTransitionFeature.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 18.04.2023.
//

import OldTCA
import Foundation

// MARK: - ListDeferredTransitionFeature

public struct ListDeferredTransitionFeature: ReducerProtocol {
    
    // MARK: - Identifiers
    
    private struct CancellationID: Hashable {}
    
    // MARK: - Feature
    
    public var body: some ReducerProtocol<ListDeferredTransitionState, ListDeferredTransitionAction> {
        Reduce { state, action in
            switch action {
            case .counter:
                return .none
            case let .setNavigation(selection: .some(id)):
                for index in state.items.indices {
                    state.items[index].isLoading = state.items[index].id == id
                }
                return Effect(value: .loadingCompleted(id))
                    .delay(for: 1, scheduler: DispatchQueue.main)
                    .eraseToEffect()
                    .cancellable(id: CancellationID())
            case .setNavigation(selection: .none):
                if let selection = state.selection, let count = selection.value?.count {
                    state.items[id: selection.id]?.count = count
                }
                state.selection = nil
                return .cancel(id: CancellationID())
            case .loadingCompleted(let id):
                state.items[id: id]?.isLoading = false
                state.selection = Identified(
                    CounterState(count: state.items[id: id]?.count ?? 0),
                    id: id
                )
                return .none
            }
        }
        .ifLet(\ListDeferredTransitionState.selection, action: /ListDeferredTransitionAction.counter) {
            EmptyReducer()
                .ifLet(\Identified<ListDeferredTransitionState.Item.ID, CounterState?>.value, action: .self) {
                    CounterFeature()
                }
        }
    }
}
