//
//  AnimationsFeature.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import OldTCA

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
