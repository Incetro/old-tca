//
//  FocusStateReducer.swift
//  verse-examples
//
//  Created by incetro on 16/02/2022.
//  Copyright © 2022 Incetro Inc. All rights reserved.
//

import TCA

// MARK: - FocusStateFeature

public struct FocusStateFeature: ReducerProtocol {
    
    public var body: some ReducerProtocol<FocusStateState, FocusStateAction> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .nextButtonTapped where state.field == .name:
                state.field = .surname
            case .nextButtonTapped where state.field == .surname:
                state.field = .email
            case .nextButtonTapped where state.field == .email:
                state.field = .password
            case .nextButtonTapped where state.field == .password:
                if state.isMandatorytDataFilled {
                    state.alert = .init(title: TextState("Success from the `Next` button!"))
                } else {
                    state.field = nil
                }
            case .actionButtonTapped:
                state.alert = .init(title: TextState("Success from `Continue` button!"))
            case .togglePasswordButtonTapped:
                state.isPasswordShowed.toggle()
            case .fillRandomDataButtonTapped:
                state.name = .generatedName.capitalized
                state.surname = .generatedName.capitalized
                state.email = .generatedName + "@incetro.com"
                state.password = .generatedName
            default:
                break
            }
            return .none
        }
    }
}
