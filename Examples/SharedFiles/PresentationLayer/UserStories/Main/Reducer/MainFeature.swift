//
//  MainFeature.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import OldTCA

// MARK: - MainFeature

public struct MainFeature: ReducerProtocol {
    
    public var body: some ReducerProtocol<MainState, MainAction> {
        Scope(state: \.counter, action: /MainAction.counter) {
            CounterFeature()
        }
        Scope(state: \.doubleCounter, action: /MainAction.doubleCounter) {
            DoubleCounterFeature()
        }
        Scope(state: \.analyzableCounter, action: /MainAction.analyzableCounter) {
            AnalyzableCounterFeature()
        }
        Scope(state: \.fibonacciCounter, action: /MainAction.fibonacciCounter) {
            FibonacciCounterFeature()
        }
        Scope(state: \.scrambler, action: /MainAction.scrambler) {
            ScramblerFeature()
        }
        Scope(state: \.flexibleBindings, action: /MainAction.flexibleBindings) {
            FlexibleBindingsFeature()
        }
        Scope(state: \.alertAndSheet, action: /MainAction.alertAndSheet) {
            AlertAndSheetFeature()
        }
        Scope(state: \.focusState, action: /MainAction.focusState) {
            FocusStateFeature()
        }
        Scope(state: \.simpleBindings, action: /MainAction.simpleBindings) {
            SimpleBindingsFeature()
        }
        Scope(state: \.simpleOptional, action: /MainAction.simpleOptional) {
            SimpleOptionalFeature()
        }
        Scope(state: \.simpleEffect, action: /MainAction.simpleEffect) {
            SimpleEffectFeature()
        }
        Scope(state: \.effectCancellation, action: /MainAction.effectCancellation) {
            EffectCancellationFeature()
        }
        Scope(state: \.effectDebounce, action: /MainAction.effectDebounce) {
            EffectDebounceFeature()
        }
        Scope(state: \.effectThrottle, action: /MainAction.effectThrottle) {
            EffectThrottleFeature()
        }
        Scope(state: \.longLivingEffect, action: /MainAction.longLivingEffect) {
            LongLivingEffectFeature()
        }
        Scope(state: \.animations, action: /MainAction.animations) {
            AnimationsFeature()
        }
        Scope(state: \.timers, action: /MainAction.timers) {
            TimersFeature()
        }
        Scope(state: \.instantTransition, action: /MainAction.instantTransition) {
            InstantTransitionFeature()
        }
        Scope(state: \.deferredTransition, action: /MainAction.deferredTransition) {
            DeferredTransitionFeature()
        }
        Scope(state: \.sheetInstantTransition, action: /MainAction.sheetInstantTransition) {
            SheetInstantTransitionFeature()
        }
        Scope(state: \.sheetDeferredTransition, action: /MainAction.sheetDeferredTransition) {
            SheetDeferredTransitionFeature()
        }
        Scope(state: \.basicList, action: /MainAction.basicList) {
            BasicListFeature()
        }
        Scope(state: \.interactiveList, action: /MainAction.interactiveList) {
            InteractiveListFeature()
        }
        Scope(state: \.listInstantTransition, action: /MainAction.listInstantTransition) {
            ListInstantTransitionFeature()
        }
        Scope(state: \.listDeferredTransition, action: /MainAction.listDeferredTransition) {
            ListDeferredTransitionFeature()
        }
        Scope(state: \.lifecycleTimer, action: /MainAction.lifecycleTimer) {
            LifecycleTimerFeature()
        }
        Scope(state: \.recursiveTree, action: /MainAction.recursiveTree) {
            RecursiveTreeFeature()
        }
        Scope(state: \.favoriteComposition, action: /MainAction.favoriteComposition) {
            FavoriteCompositionFeature()
        }
        Reduce { state, action in
            switch action {
            case .onAppear:
                state = .init()
            default:
                break
            }
            return .none
        }
    }
}
