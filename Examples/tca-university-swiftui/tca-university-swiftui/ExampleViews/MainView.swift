//
//  MainView.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import SwiftUI
import TCA

// MARK: - MainView

public struct MainView: View {

    // MARK: - Properties

    let store: StoreOf<MainFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store.stateless) { viewStore in
            NavigationView {
                Form {
                    Section(header: Text("👶🏻 Beginner")) {
                        NavigationLink(
                            destination: CounterExampleView(
                                store: store.scope(
                                    state: \.counter,
                                    action: MainAction.counter
                                )
                            )
                        ) {
                            Text("Basics").standard
                        }
                        NavigationLink(
                            destination: DoubleCounterView(
                                store: store.scope(
                                    state: \.doubleCounter,
                                    action: MainAction.doubleCounter
                                )
                            )
                        ) {
                            Text("Double counter").standard
                        }
                        NavigationLink(
                            destination: AnalyzableCounterView(
                                store: store.scope(
                                    state: \.analyzableCounter,
                                    action: MainAction.analyzableCounter
                                )
                            )
                        ) {
                            Text("Analyzable counter").standard
                        }
                        NavigationLink(
                            destination: FibonacciCounterView(
                                store: store.scope(
                                    state: \.fibonacciCounter,
                                    action: MainAction.fibonacciCounter
                                )
                            )
                        ) {
                            Text("Fibonacci counter").standard
                        }
                        NavigationLink(
                            destination: ScramblerView(
                                store: store.scope(
                                    state: \.scrambler,
                                    action: MainAction.scrambler
                                )
                            )
                        ) {
                            Text("Scrambler").standard
                        }
                    }
                    Section(header: Text("💡 Elementary")) {
                    }
                    Section(header: Text("🙋🏻‍♂️ Pre Intermediate")) {
                    }
                    Section(header: Text("👨🏻‍💻 Intermediate")) {
                    }
                    Section(header: Text("👨🏻‍🏫 Upper intermediate")) {
                    }
                    Section(header: Text("👨🏻‍🎓 Advanced")) {
                    }
                    Section(header: Text("🥷🏻 Proficient")) {
                    }
                }
                .navigationBarTitle("TCA")
                .onAppear { viewStore.send(.onAppear) }
            }
        }
    }
}

let globalFontSize: CGFloat = 17
