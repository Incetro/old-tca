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
                        NavigationLink(
                            destination: SimpleOptionalView(
                                store: store.scope(
                                    state: \.simpleOptional,
                                    action: MainAction.simpleOptional
                                )
                            )
                        ) {
                            Text("Simple optional").standard
                        }
                        NavigationLink(
                            destination: SimpleBindingsView(
                                store: store.scope(
                                    state: \.simpleBindings,
                                    action: MainAction.simpleBindings
                                )
                            )
                        ) {
                            Text("Manual bindings").standard
                        }
                        NavigationLink(
                            destination: FlexibleBindingsView(
                                store: store.scope(
                                    state: \.flexibleBindings,
                                    action: MainAction.flexibleBindings
                                )
                            )
                        ) {
                            Text("Automatic bindings").standard
                        }
                        if #available(iOS 15.0, *) {
                            NavigationLink(
                                destination: FocusStateView(
                                    store: store.scope(
                                        state: \.focusState,
                                        action: MainAction.focusState
                                    )
                                )
                            ) {
                                Text("Focus state").standard
                            }
                        }
                        NavigationLink(
                            destination: AlertAndSheetView(
                                store: store.scope(
                                    state: \.alertAndSheet,
                                    action: MainAction.alertAndSheet
                                )
                            )
                        ) {
                            Text("Alert and ActionSheet").standard
                        }
                    }
                    Section(header: Text("🙋🏻‍♂️ Pre Intermediate")) {
                        NavigationLink(
                            destination: SimpleEffectView(
                                store: store.scope(
                                    state: \.simpleEffect,
                                    action: MainAction.simpleEffect
                                )
                            )
                        ) {
                            Text("Effects").standard
                        }
                        NavigationLink(
                            destination: EffectCancellationView(
                                store: store.scope(
                                    state: \.effectCancellation,
                                    action: MainAction.effectCancellation
                                )
                            )
                        ) {
                            Text("Effect cancellation").standard
                        }
                        NavigationLink(
                            destination: EffectDebounceView(
                                store: store.scope(
                                    state: \.effectDebounce,
                                    action: MainAction.effectDebounce
                                )
                            )
                        ) {
                            Text("Debounce").standard
                        }
                        NavigationLink(
                            destination: EffectThrottleView(
                                store: store.scope(
                                    state: \.effectThrottle,
                                    action: MainAction.effectThrottle
                                )
                            )
                        ) {
                            Text("Throttle").standard
                        }
                        NavigationLink(
                            destination: LongLivingEffectView(
                                store: store.scope(
                                    state: \.longLivingEffect,
                                    action: MainAction.longLivingEffect
                                )
                            )
                        ) {
                            Text("Long-living effects").standard
                        }
                    }
                    Section(header: Text("👨🏻‍💻 Intermediate")) {
                        NavigationLink(
                            destination: AnimationsView(
                                store: store.scope(
                                    state: \.animations,
                                    action: MainAction.animations
                                )
                            )
                        ) {
                            Text("Animations").standard
                        }
                        NavigationLink(
                            destination: TimersView(
                                store: store.scope(
                                    state: \.timers,
                                    action: MainAction.timers
                                )
                            )
                        ) {
                            Text("Timers").standard
                        }
                        NavigationLink(
                            destination: InstantTransitionView(
                                store: store.scope(
                                    state: \.instantTransition,
                                    action: MainAction.instantTransition
                                )
                            )
                        ) {
                            Text("Instant transition").standard
                        }
                        NavigationLink(
                            destination: DeferredTransitionView(
                                store: store.scope(
                                    state: \.deferredTransition,
                                    action: MainAction.deferredTransition
                                )
                            )
                        ) {
                            Text("Deferred transition").standard
                        }
                        NavigationLink(
                            destination: SheetInstantTransitionView(
                                store: store.scope(
                                    state: \.sheetInstantTransition,
                                    action: MainAction.sheetInstantTransition
                                )
                            )
                        ) {
                            Text("Sheet instance transition").standard
                        }
                        NavigationLink(
                            destination: SheetDeferredTransitionView(
                                store: store.scope(
                                    state: \.sheetDeferredTransition,
                                    action: MainAction.sheetDeferredTransition
                                )
                            )
                        ) {
                            Text("Sheet deferred transition").standard
                        }
                        NavigationLink(
                            destination: BasicListView(
                                store: store.scope(
                                    state: \.basicList,
                                    action: MainAction.basicList
                                )
                            )
                        ) {
                            Text("Basic list").standard
                        }
                        NavigationLink(
                            destination: InteractiveListView(
                                store: store.scope(
                                    state: \.interactiveList,
                                    action: MainAction.interactiveList
                                )
                            )
                        ) {
                            Text("Interactive list").standard
                        }
                    }
                    Section(header: Text("👨🏻‍🏫 Upper intermediate")) {
                        NavigationLink(
                            destination: ListInstantTransitionView(
                                store: store.scope(
                                    state: \.listInstantTransition,
                                    action: MainAction.listInstantTransition
                                )
                            )
                        ) {
                            Text("List instant transition").standard
                        }
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
