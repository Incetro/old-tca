//
//  MainFeature.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import TCA

// MARK: - MainFeature

public struct MainFeature: ReducerProtocol {
    
    public var body: some ReducerProtocol<MainState, MainAction> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state = .init()
            default:
                break
            }
            return .none
        }
        Scope(state: \.counter, action: /MainAction.counter) {
            CounterFeature()
        }
    }
}
