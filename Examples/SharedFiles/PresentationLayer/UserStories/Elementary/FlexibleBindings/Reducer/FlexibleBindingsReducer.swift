//
//  FlexibleBindingsReducer.swift
//  verse-examples
//
//  Created by Nikita Lezya on 29/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA

// MARK: - CounterFeature

public struct FlexibleBindingsFeature: ReducerProtocol {
    
    public var body: some ReducerProtocol<FlexibleBindingsState, FlexibleBindingsAction> {
        BindingReducer()
        Scope(state: \.counterState, action: /FlexibleBindingsAction.counter) {
            CounterFeature()
        }
        Reduce { state, action in
            switch action {
            case .resetControls:
                state = FlexibleBindingsState()
            case .counter(.decrementButtonTapped):
                state.sliderValue = Double(min(state.counterState.count, Int(state.sliderValue)))
            default:
                break
            }
            return .none
        }
    }
}
