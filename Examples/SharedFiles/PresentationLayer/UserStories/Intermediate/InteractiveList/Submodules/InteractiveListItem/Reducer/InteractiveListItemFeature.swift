//
//  InteractiveListItemFeature.swift
//  verse-examples
//
//  Created by incetro on 09/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import OldTCA

// MARK: - InteractiveListItemFeature

public struct InteractiveListItemFeature: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public var body: some ReducerProtocol<InteractiveListItemState, InteractiveListItemAction> {
        Reduce { state, action in
            switch action {
            case .checkBoxToggled:
                state.isChecked.toggle()
                return .none
            }
        }
    }
}
