//
//  FocusStateState.swift
//  verse-examples
//
//  Created by incetro on 16/02/2022.
//  Copyright © 2022 Incetro Inc. All rights reserved.
//

import TCA
import Foundation

// MARK: - FocusStateState

/// `FocusState` module state
///
/// Basically, `FocusStateState` is a type that describes the data
/// `FocusState` feature needs to perform its logic and render its UI.
public struct FocusStateState: Equatable {

    // MARK: - Field

    public enum Field {
        case name
        case surname
        case email
        case password
    }

    // MARK: - Properties

    public var isMandatorytDataFilled: Bool {
        email.isValidEmail && !password.isEmpty && !name.isEmpty && !surname.isEmpty
    }

    /// Currently active field
    @BindableState public var field: Field? = .name

    /// Name value
    @BindableState public var name = ""

    /// Surname value
    @BindableState public var surname = ""

    /// Username value
    @BindableState public var email = ""

    /// Password value
    @BindableState var password = ""

    /// True if need to show user password
    public var isPasswordShowed = false

    /// AlertState instance
    public var alert: AlertState<FocusStateAction>?
}

private extension String {

    var isValidEmail: Bool {
        let regex = try! NSRegularExpression(
            pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
            options: .caseInsensitive
        )
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
