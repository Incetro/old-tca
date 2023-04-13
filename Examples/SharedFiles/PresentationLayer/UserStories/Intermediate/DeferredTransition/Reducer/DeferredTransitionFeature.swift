//
//  DeferredTransitionFeature.swift
//  verse-examples
//
//  Created by incetro on 08/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//
import TCA
import Foundation

// MARK: - DeferredTransitionFeature

public struct DeferredTransitionFeature: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public var body: some ReducerProtocol<DeferredTransitionState, DeferredTransitionAction> {
        Reduce { state, action in
            switch action {
            case .setNavigation(isActive: true):
                state.isLoading = true
                return Effect(value: DeferredTransitionAction.loadingCompleted)
                    .delay(for: 1, scheduler: DispatchQueue.main)
                    .eraseToEffect()
            case .setNavigation(isActive: false):
                state.counter = nil
                return .none
            case .loadingCompleted:
                state.isLoading = false
                state.counter = CounterState()
                return .none
            default:
                return .none
            }
        }
        .ifLet(\.counter, action: /DeferredTransitionAction.counter) {
            CounterFeature()
        }
    }
}
