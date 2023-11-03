//
//  SheetDeferredTransitionFeature.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import OldTCA
import Foundation

// MARK: - SheetDeferredTransitionFeature

public struct SheetDeferredTransitionFeature: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public var body: some ReducerProtocol<SheetDeferredTransitionState, SheetDeferredTransitionAction> {
        Reduce { state, action in
            switch action {
            case .counter:
                return .none
            case .setSheet(isPresented: true):
                state.isLoading = true
                return Effect(value: SheetDeferredTransitionAction.loadingCompleted)
                    .delay(for: 1, scheduler: DispatchQueue.main)
                    .eraseToEffect()
            case .setSheet(isPresented: false):
                state.counter = nil
                return .none
            case .loadingCompleted:
                state.isLoading = false
                state.counter = CounterState()
            }
            return .none
        }
        .ifLet(\.counter, action: /SheetDeferredTransitionAction.counter) {
            CounterFeature()
        }
    }
}
