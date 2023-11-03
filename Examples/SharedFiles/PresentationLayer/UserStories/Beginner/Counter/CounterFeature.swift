//
//  CounterFeature.swift
//  TCA-swiftui-examples
//
//  Created by incetro on 10/13/21.
//

import OldTCA

// MARK: - CounterFeature

public struct CounterFeature: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public func reduce(into state: inout CounterState, action: CounterAction) -> EffectTask<CounterAction> {
        switch action {
        case .incrementButtonTapped:
            state.count += 1
        case .decrementButtonTapped:
            state.count -= 1
        }
        return .none
    }
}
