//
//  AlertAndSheetState.swift
//  TCA-examples
//
//  Created by incetro on 31/10/2021.
//  Copyright © 2021 Incetro Inc. All rights reserved.
//

import OldTCA

// MARK: - AlertAndSheetState

/// `AlertAndSheet` module state
///
/// Basically, `AlertAndSheetState` is a type that describes the data
/// `AlertAndSheet` feature needs to perform its logic and render its UI.
public struct AlertAndSheetState: Equatable {

    // MARK: - Properties

    /// Currently displaying action sheet
    public var actionSheet: ConfirmationDialogState<AlertAndSheetAction>?

    /// Currently displaying alert
    public var alert: AlertState<AlertAndSheetAction>?

    /// Current testing value
    public var count = 0
}
