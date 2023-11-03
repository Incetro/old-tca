//
//  Conditional.swift
//  verse
//
//  Created by incetro on 01/01/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - Value

extension EffectPublisher {

    /// Returns one of 2 effects that based on some condition
    /// that defines which one should be returned:
    ///
    /// You can use `if-else-then` style:
    /// ```
    /// return .when(
    ///     state.isEditing,
    ///     then: EffectPublisher(value: .setEditingSettings(true)),
    ///     else: environment
    ///         .someService
    ///         .updateData()
    ///         .eraseToEffect()
    /// )
    /// ```
    ///
    /// Or just `if-else` style:
    /// ```
    /// return .when(
    ///     state.isEditing,
    ///     then: EffectPublisher(value: .setEditingSettings(true))
    /// )
    /// ```
    ///
    /// - Parameters:
    ///     - value: target value
    /// - Returns: An EffectPublisher that will be executed after `dueTime`
    public static func when(_ condition: Bool, then: EffectPublisher, `else`: EffectPublisher? = nil) -> EffectPublisher {
        condition ? then : (`else` ?? .none)
    }

    /// Returns one of 2 effects that returns the given value
    /// based on some condition that defines which one should be returned:
    ///
    /// You can use `if-else-then` style:
    /// ```
    /// return .when(
    ///     state.isEditing,
    ///     then: .setEditingSettings(true),
    ///     else: .setEditingSettings(false)
    /// )
    /// ```
    ///
    /// Or just `if-else` style:
    /// ```
    /// return .when(state.isEditing, then: .setEditingSettings(true))
    /// ```
    ///
    /// - Parameters:
    ///     - value: target value
    /// - Returns: An EffectPublisher that will be executed after `dueTime`
    public static func when(_ condition: Bool, then: Output, `else`: Output? = nil) -> EffectPublisher {
        condition ? .value(then) : (`else`.map(EffectPublisher.init) ?? .none)
    }

    /// Returns one of 2 effects that based on a non-nil condition of the given value
    /// that defines which one should be returned:
    ///
    /// You can use `if-else-then` style:
    /// ```
    /// return .ifNotNil(
    ///     state.selectedImage,
    ///     then: .setImagePicker(true),
    ///     else: .setEditingSettings(true)
    /// )
    /// ```
    ///
    /// Or just `if-else` style:
    /// ```
    /// return .ifNotNil(
    ///     state.selectedImage,
    ///     then: EffectPublisher(value: .setImagePicker(true))
    /// )
    /// ```
    ///
    /// - Parameters:
    ///     - value: target value
    /// - Returns: An EffectPublisher that will be executed after `dueTime`
    public static func ifNotNil(_ condition: Any?, then: EffectPublisher, `else`: EffectPublisher? = nil) -> EffectPublisher {
        .when(condition != nil, then: then, else: `else`)
    }

    /// Returns one of 2 effects that returns the given value
    /// based on a non-nil condition of the given value that defines which one should be returned:
    ///
    /// You can use `if-else-then` style:
    /// ```
    /// return .ifNotNil(
    ///     state.selectedImage,
    ///     then: .setImagePicker(true),
    ///     else: .setEditingSettings(true)
    /// )
    /// ```
    ///
    /// Or just `if-else` style:
    /// ```
    /// return .ifNotNil(state.selectedImage, then: .setImagePicker(true))
    /// ```
    ///
    /// - Parameters:
    ///     - value: target value
    /// - Returns: An EffectPublisher that will be executed after `dueTime`
    public static func ifNotNil(_ condition: Any?, then: Output, `else`: Output? = nil) -> EffectPublisher {
        .when(condition != nil, then: then, else: `else`)
    }

    /// Returns one of 2 effects that based on a non-nil condition of the given value
    /// that defines which one should be returned:
    ///
    /// You can use `if-else-then` style:
    /// ```
    /// return .ifNil(
    ///     state.selectedImage,
    ///     then: .setImagePicker(true),
    ///     else: .setEditingSettings(true)
    /// )
    /// ```
    ///
    /// Or just `if-else` style:
    /// ```
    /// return .ifNil(
    ///     state.selectedImage,
    ///     then: EffectPublisher(value: .setImagePicker(true))
    /// )
    /// ```
    ///
    /// - Parameters:
    ///     - value: target value
    /// - Returns: An EffectPublisher that will be executed after `dueTime`
    public static func ifNil(_ condition: Any?, then: EffectPublisher, `else`: EffectPublisher? = nil) -> EffectPublisher {
        .when(condition == nil, then: then, else: `else`)
    }

    /// Returns one of 2 effects that returns the given value
    /// based on a non-nil condition of the given value that defines which one should be returned:
    ///
    /// You can use `if-else-then` style:
    /// ```
    /// return .ifNil(
    ///     state.selectedImage,
    ///     then: .setImagePicker(true),
    ///     else: .setEditingSettings(true)
    /// )
    /// ```
    ///
    /// Or just `if-else` style:
    /// ```
    /// return .ifNil(state.selectedImage, then: .setImagePicker(true))
    /// ```
    ///
    /// - Parameters:
    ///     - value: target value
    /// - Returns: An EffectPublisher that will be executed after `dueTime`
    public static func ifNil(_ condition: Any?, then: Output, `else`: Output? = nil) -> EffectPublisher {
        .when(condition == nil, then: then, else: `else`)
    }
}
