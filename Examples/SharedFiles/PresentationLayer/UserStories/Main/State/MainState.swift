//
//  MainState.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Foundation

// MARK: - MainState

/// `Main` module state
///
/// Basically, `MainState` is a type that describes the data
/// `Main` feature needs to perform its logic and render its UI.
public struct MainState: Equatable {

    // MARK: - Properties
    
    /// CounterState instance
    public var counter = CounterState(count: 13)
    
    /// DoubleCounterState instance
    public var doubleCounter = DoubleCounterState()
    
    /// AnalyzableCounterState instance
    public var analyzableCounter = AnalyzableCounterState()
    
    /// FibonacciCounterState instance
    public var fibonacciCounter = FibonacciCounterState()
    
    /// ScramblerState instance
    public var scrambler = ScramblerState()
    
    /// SimpleOptionalState instance
    public var simpleOptional = SimpleOptionalState()

    /// SimpleBindingsState instance
    public var simpleBindings = SimpleBindingsState()

    /// FlexibleBindingsState instance
    public var flexibleBindings = FlexibleBindingsState()
    
    /// AlertAndSheetState instance
    public var alertAndSheet = AlertAndSheetState()
    
    /// FocusStateState instance
    public var focusState = FocusStateState()
    
    /// SimpleEffectState instance
    public var simpleEffect = SimpleEffectState()
    
    /// EffectCancellationState instance
    public var effectCancellation = EffectCancellationState()
    
    /// EffectCancellationState instance
    public var effectDebounce = EffectDebounceState()
    
    /// EffectCancellationState instance
    public var effectThrottle = EffectThrottleState()
    
    /// LongLivingEffectState instance
    public var longLivingEffect = LongLivingEffectState()
    
    /// AnimationsState instance
    public var animations = AnimationsState()
    
    /// TimersState instance
    public var timers = TimersState()
    
    /// InstantTransitionState instance
    public var instantTransition = InstantTransitionState()
    
    /// DeferredTransitionState instance
    public var deferredTransition = DeferredTransitionState()
    
    /// SheetInstantTransitionState instance
    public var sheetInstantTransition = SheetInstantTransitionState()
    
    /// SheetDeferredTransitionState instance
    public var sheetDeferredTransition = SheetDeferredTransitionState()
    
    /// BasicListState
    public var basicList = BasicListState()
    
    /// InteractiveListState instance
    public var interactiveList = InteractiveListState()
    
    /// ListInstantTransitionState instance
    public var listInstantTransition = ListInstantTransitionState()
    
    /// ListDeferredTransitionState instance
    public var listDeferredTransition = ListDeferredTransitionState()
    
    /// LifecycleTimer state
    public var lifecycleTimer = LifecycleTimerState()
    
    /// RecursiveTreeState instance
    public var recursiveTree = RecursiveTreeState.random()
    
    /// FavoriteComposition instance
    public var favoriteComposition = FavoriteCompositionState.default
}
