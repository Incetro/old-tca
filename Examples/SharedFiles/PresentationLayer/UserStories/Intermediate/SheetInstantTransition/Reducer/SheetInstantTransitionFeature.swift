//
//  SheetInstantTransitionFeature.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
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
