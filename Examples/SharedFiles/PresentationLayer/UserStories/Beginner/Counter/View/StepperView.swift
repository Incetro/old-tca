//
//  StepperView.swift
//  verse-examples
//
//  Created by Nikita Lezya on 09/11/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import SwiftUI

// MARK: - StepperView

public struct StepperView: View {

    // MARK: - Properties

    let store: StoreOf<CounterFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                Rectangle()
                    .cornerRadius(8)
                    .foregroundColor(Color(hex: "EEEEEE"))
                HStack {
                    HStack {
                        Spacer()
                        Button {
                            viewStore.send(.decrementButtonTapped)
                        } label: {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    Rectangle()
                        .frame(width: 1, height: 18)
                        .foregroundColor(Color(hex: "DDDDDD"))
                        .cornerRadius(1)
                    Text("\(viewStore.count)")
                        .font(.system(size: globalFontSize, design: .rounded).monospacedDigit())
                        .foregroundColor(.black)
                    Rectangle()
                        .frame(width: 1, height: 18)
                        .foregroundColor(Color(hex: "DDDDDD"))
                        .cornerRadius(1)
                    HStack {
                        Spacer()
                        Button {
                            viewStore.send(.incrementButtonTapped)
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                }
            }.frame(maxWidth: 130, maxHeight: 32)
        }
    }
}
