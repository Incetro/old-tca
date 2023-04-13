//
//  SheetInstantTransitionFeature.swift
//  verse-examples
//
//  Created by incetro on 10/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//
import TCA
import Foundation

// MARK: - SheetInstantTransitionFeature

public struct SheetInstantTransitionFeature: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public var body: some ReducerProtocol<SheetInstantTransitionState, SheetInstantTransitionAction> {
        Reduce { state, action in
            switch action {
            case .counter:
                return .none
            case .setSheet(isPresented: true):
                state.isSheetPresented = true
                return Effect(value: .loadingCompleted)
                    .delay(for: 1, scheduler: DispatchQueue.main)
                    .eraseToEffect()
            case .setSheet(isPresented: false):
                state.isSheetPresented = false
                state.counter = nil
                return .none
            case .loadingCompleted:
                state.counter = CounterState()
                return .none
            }
        }
        .ifLet(\.counter, action: /SheetInstantTransitionAction.counter) {
            CounterFeature()
        }
    }
}
