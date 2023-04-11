//
//  EffectThrottleFeature.swift
//  verse-examples
//
//  Created by incetro on 15/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import Foundation

// MARK: - EffectThrottleFeature

public struct EffectThrottleFeature: ReducerProtocol {
    
    // MARK: - Identifiars
    
    struct NumberFactRequestID: Hashable {}
    struct NumberFactDebounceID: Hashable {}
    
    // MARK: - Properties
    
    /// NumberFactService instance
    public let numberFactService = NumberFactServiceImplementation()
    
    // MARK: - ReducerProtocol
    
    public var body: some ReducerProtocol<EffectThrottleState, EffectThrottleAction> {
        Scope(state: \.counter, action: /EffectThrottleAction.counter) {
            CounterFeature()
        }
        Reduce { state, action in
            switch action {
            case .generateFact:
                state.numberFact = nil
                state.isFactRequestInFlight = true
                return .task { [count = state.counter.count] in
                    await .numberFactResponse(
                        TaskResult {
                            try await numberFactService.generateFact(number: count)
                        }
                    )
                }
                .cancellable(id: NumberFactRequestID(), cancelInFlight: true)
            case let .numberFactResponse(.success(fact)):
                state.isFactRequestInFlight = false
                state.numberFact = fact
                return .none
            case .numberFactResponse(.failure):
                state.isFactRequestInFlight = false
                return .none
            case .cancelButtonTapped:
                state.isFactRequestInFlight = false
                return .cancel(id: NumberFactRequestID())
            case .counter:
                return Effect(value: .generateFact).throttle(id: NumberFactDebounceID(), for: 1, scheduler: DispatchQueue.main, latest: true)
            }
        }
    }
}
