//
//  SheetDeferredTransitionFeature.swift
//  verse-examples
//
//  Created by incetro on 10/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
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
