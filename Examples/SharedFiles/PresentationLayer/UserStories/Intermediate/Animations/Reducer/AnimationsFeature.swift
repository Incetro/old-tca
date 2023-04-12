//
//  AnimationsFeature.swift
//  verse-examples
//
//  Created by incetro on 06/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA

// MARK: - AnimationsFeature

public struct AnimationsFeature: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public var body: some ReducerProtocol<AnimationsState, AnimationsAction> {
        Reduce { state, action in
            switch action {
            case .randomProgressButtonTapped:
                state.progress = Double.random(in: 0.1...1)
            }
            return .none
        }
    }
}
