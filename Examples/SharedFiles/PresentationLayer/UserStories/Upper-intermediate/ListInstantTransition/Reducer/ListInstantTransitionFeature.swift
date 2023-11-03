//
//  ListInstantTransitionFeature.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 18.04.2023.
//

import OldTCA
import Foundation

// MARK: - ListInstantTransitionFeature

public struct ListInstantTransitionFeature: ReducerProtocol {
    
    // MARK: - Identifiers
    
    private struct CancellationID: Hashable {}
    
    // MARK: - Feature
    
    public var body: some ReducerProtocol<ListInstantTransitionState, ListInstantTransitionAction> {
        Reduce { state, action in
            switch action {
            case .counter:
                return .none
            case let .setNavigation(selection: .some(id)):
                state.selection = Identified(nil, id: id)
                return Effect(value: .loadingCompleted)
                    .delay(for: 1, scheduler: DispatchQueue.main)
                    .eraseToEffect()
                    .cancellable(id: CancellationID())
            case .setNavigation(selection: .none):
                if let selection = state.selection, let count = selection.value?.count {
                    state.items[id: selection.id]?.count = count
                }
                state.selection = nil
                return .cancel(id: CancellationID())
            case .loadingCompleted:
                guard let id = state.selection?.id else { return .none }
                state.selection?.value = CounterState(count: state.items[id: id]?.count ?? 0)
                return .none
            }
        }
        .ifLet(\ListInstantTransitionState.selection, action: /ListInstantTransitionAction.counter) {
            EmptyReducer()
                .ifLet(\Identified<ListInstantTransitionState.Item.ID, CounterState?>.value, action: .self) {
                    CounterFeature()
                }
        }
    }
}
