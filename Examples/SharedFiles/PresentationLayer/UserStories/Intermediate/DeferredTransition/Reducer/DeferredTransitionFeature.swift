//
//  DeferredTransitionFeature.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//
import OldTCA
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
