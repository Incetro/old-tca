//
//  AlertAndSheetReducer.swift
//  TCA-examples
//
//  Created by incetro on 31/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import OldTCA

// MARK: - AlertAndSheetFeature

public struct AlertAndSheetFeature: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public func reduce(into state: inout AlertAndSheetState, action: AlertAndSheetAction) -> EffectTask<AlertAndSheetAction> {
        switch action {
        case .actionSheetButtonTapped:
            state.actionSheet = .init(
                title: TextState("Action sheet"),
                message: TextState("This is an action sheet."),
                buttons: [
                    .cancel(TextState("Cancel")),
                    .default(TextState("Increment"), action: .send(.incrementButtonTapped)),
                    .default(TextState("Decrement"), action: .send(.decrementButtonTapped)),
                ]
            )
            return .none
        case .actionSheetCancelTapped:
            return .none
        case .actionSheetDismissed:
            state.actionSheet = nil
            return .none
        case .alertButtonTapped:
            state.alert = AlertState(
                title: TextState("Alert!"),
                message: TextState("This is an alert"),
                buttons: [
                    .cancel(TextState("Cancel")),
                    .default(.init("Increment"), action: .send(.incrementButtonTapped))
                ]
            )
            return .none
        case .alertCancelTapped:
            return .none
        case .alertDismissed:
            state.alert = nil
            return .none
        case .decrementButtonTapped:
            state.alert = AlertState(title: TextState("Decremented 👇🏻"))
            state.count -= 1
            return .none
        case .incrementButtonTapped:
            state.alert = AlertState(title: TextState("Incremented 👆🏻"))
            state.count += 1
            return .none
        }
    }
}
