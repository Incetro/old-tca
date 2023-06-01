//
//  RecursiveTreeFeature.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import TCA

// MARK: - RecursiveTreeFeature

public struct RecursiveTreeFeature: ReducerProtocol {
    
    // MARK: - Feature
    
    public var body: some ReducerProtocol<RecursiveTreeState, RecursiveTreeAction> {
        Reduce { state, action in
            switch action {
            case .append:
                state.children.append(
                    RecursiveTreeState(name: .generatedName)
                )
            case .remove(let offset):
                state.children.remove(atOffsets: offset)
            case .child:
                return .none
            }
            return .none
        }
        .forEach(\.children, action: /RecursiveTreeAction.child(id:action:)) {
            Self()
        }
    }
}
