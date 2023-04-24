//
//  MainAction.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import Foundation

// MARK: - MainAction

/// All available `Main` module actions.
///
/// It's a type that represents all of the actions that can happen in `Main` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum MainAction: Equatable {

    // MARK: - Cases
    
    /// General action that calls when view appears
    case onAppear
    
    // MARK: - Beginner
    
    /// Child action for `Counter` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `counter` case means that every action in `Counter` module
    /// will be sent to current module through it
    case counter(CounterAction)
    
    /// Child action for `DoubleCounter` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `doubleCounter` case means that every action in `DoubleCounter` module
    /// will be sent to current module through it
    case doubleCounter(DoubleCounterAction)
    
    /// Child action for `AnalyzableCounter` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `analyzableCounter` case means that every action in `AnalyzableCounter` module
    /// will be sent to current module through it
    case analyzableCounter(AnalyzableCounterAction)
    
    /// Child action for `FibonacciCounter` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `fibonacciCounter` case means that every action in `FibonacciCounter` module
    /// will be sent to current module through it
    case fibonacciCounter(FibonacciCounterAction)
    
    /// Child action for `Scrambler` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `scrambler` case means that every action in `Scrambler` module
    /// will be sent to current module through it
    case scrambler(ScramblerAction)
    
    // MARK: - Elementary
    
    /// Child action for `SimpleOptional` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `simpleOptional` case means that every action in `SimpleOptional` module
    /// will be sent to current module through it
    case simpleOptional(SimpleOptionalAction)
    
    /// Child action for `SimpleBindings` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `simpleBindings` case means that every action in `SimpleBindings` module
    /// will be sent to current module through it
    case simpleBindings(SimpleBindingsAction)
    
    /// Child action for `FlexibleBindings` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `flexibleBindings` case means that every action in `FlexibleBindings` module
    /// will be sent to current module through it
    case flexibleBindings(FlexibleBindingsAction)
    
    /// Child action for `AlertAndSheet` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `alertAndSheet` case means that every action in `AlertAndSheet` module
    /// will be sent to current module through it
    case alertAndSheet(AlertAndSheetAction)
    
    /// Child action for `FocusState` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `focusState` case means that every action in `FocusState` module
    /// will be sent to current module through it
    case focusState(FocusStateAction)
    
    // MARK: - PreIntermediate
    
    /// Child action for `SimpleEffect` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `simpleEffect` case means that every action in `SimpleEffect` module
    /// will be sent to current module through it
    case simpleEffect(SimpleEffectAction)
    
    /// Child action for `EffectCancellation` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `effectCancellation` case means that every action in `EffectCancellation` module
    /// will be sent to current module through it
    case effectCancellation(EffectCancellationAction)
    
    /// Child action for `EffectDebounce` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `effectDebounce` case means that every action in `EffectDebounce` module
    /// will be sent to current module through it
    case effectDebounce(EffectDebounceAction)
    
    /// Child action for `EffectThrottle` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `effectThrottle` case means that every action in `EffectThrottle` module
    /// will be sent to current module through it
    case effectThrottle(EffectThrottleAction)
    
    /// Child action for `LongLivingEffect` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `longLivingEffect` case means that every action in `LongLivingEffect` module
    /// will be sent to current module through it
    case longLivingEffect(LongLivingEffectAction)
    
    // MARK: - Intermediate
    
    /// Child action for `Animations` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `animations` case means that every action in `Animations` module
    /// will be sent to current module through it
    case animations(AnimationsAction)
    
    /// Child action for `Timers` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `timers` case means that every action in `Timers` module
    /// will be sent to current module through it
    case timers(TimersAction)
    
    /// Child action for `InstantTransition` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `instantTransition` case means that every action in `InstantTransition` module
    /// will be sent to current module through it
    case instantTransition(InstantTransitionAction)
    
    /// Child action for `DeferredTransition` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `deferredTransition` case means that every action in `DeferredTransition` module
    /// will be sent to current module through it
    case deferredTransition(DeferredTransitionAction)
    
    /// Child action for `SheetInstantTransition` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `sheetInstantTransition` case means that every action in `SheetInstantTransition` module
    /// will be sent to current module through it
    case sheetInstantTransition(SheetInstantTransitionAction)
    
    /// Child action for `SheetDeferredTransition` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `sheetDeferredTransition` case means that every action in `SheetDeferredTransition` module
    /// will be sent to current module through it
    case sheetDeferredTransition(SheetDeferredTransitionAction)
    
    /// Child action for `BasicList` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `basicList` case means that every action in `BasicList` module
    /// will be sent to current module through it
    case basicList(BasicListAction)
    
    /// Child action for `InteractiveList` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `interactiveList` case means that every action in `InteractiveList` module
    /// will be sent to current module through it
    case interactiveList(InteractiveListAction)
    
    // MARK: - UpperIntermediate
    
    /// Child action for `ListInstantTransition` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `listInstantTransition` case means that every action in `ListInstantTransition` module
    /// will be sent to current module through it
    case listInstantTransition(ListInstantTransitionAction)
    
    /// Child action for `ListDeferredTransition` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `listDeferredTransition` case means that every action in `ListDeferredTransition` module
    /// will be sent to current module through it
    case listDeferredTransition(ListDeferredTransitionAction)
    
    // MARK: - Advanced
    
    /// Child action for `LifecycleTimerAction` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `lifecycleTimer` case means that every action in `LifecycleTimer` module
    /// will be sent to current module through it
    case lifecycleTimer(LifecycleTimerAction)
    
    // MARK: - Advanced
    
    /// Child action for `RecursiveTree` module.
    ///
    /// It's necessary as we use `Scope` builder in current module's reducer.
    /// In short, the `recursiveTree` case means that every action in `RecursiveTree` module
    /// will be sent to current module through it
    case recursiveTree(RecursiveTreeAction)
}
