//
//  ScramblerView.swift
//  verse-examples
//
//  Created by incetro on 10/12/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import TCA
import SwiftUI

// MARK: - ScramblerView

struct ScramblerView: View {

    // MARK: - Properties

    /// The store powering the `Scrambler` feature
    public let store: StoreOf<ScramblerFeature>

    // MARK: - View

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Text(viewStore.scramble ?? "Tap anywhere to generate a new scramble")
                        .font(.system(size: 27).monospacedDigit())
                        .bold()
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    Spacer()
                    HStack {
                        Button {
                            viewStore.send(.minusButtonTapped)
                        } label: {
                            Image(systemName: "minus")
                                .foregroundColor(.white)
                        }
                        .frame(width: 60, height: 60, alignment: .center)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .font(Font.system(size: 27))
                        .foregroundColor(Color.red)
                        Spacer()
                        Text("Scramble size: \(viewStore.currentScrambleLength)")
                            .font(.system(size: 17, weight: .semibold, design: .monospaced))
                            .foregroundColor(.black)
                        Spacer()
                        Button {
                            viewStore.send(.plusButtonTapped)
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                        }
                        .frame(width: 60, height: 60, alignment: .center)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .font(Font.system(size: 27))
                        .foregroundColor(Color.red)
                    }.padding(30)
                }
            }.onTapGesture {
                viewStore.send(.generateButtonTapped)
            }
        }
    }
}
