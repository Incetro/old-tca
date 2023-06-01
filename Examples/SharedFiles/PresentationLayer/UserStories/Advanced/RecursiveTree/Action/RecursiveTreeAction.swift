//
//  RecursiveTreeAction.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import Foundation

// MARK: - RecursiveTreeAction

/// All available `RecursiveTree` module actions.
///
/// It's a type that represents all of the actions that can happen in `RecursiveTree` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public indirect enum RecursiveTreeAction: Equatable {

    // MARK: - Cases

    /// An action representing the addition of a new node to the tree.
    case append

    /// An action representing the modification of a child node identified by its unique ID.
    ///
    /// - Parameters:
    ///   - id: The unique ID of the child node to be modified.
    ///   - action: The action to be performed on the child node.
    case child(id: RecursiveTreeState.ID, action: RecursiveTreeAction)

    /// An action representing the removal of one or more nodes from the tree.
    ///
    /// - Parameter indices: A set of indices specifying the nodes to be removed.
    case remove(IndexSet)
}
