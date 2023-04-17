//
//  InteractiveListAction.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 17.04.2023.
//

import SwiftUI
import Foundation

// MARK: - InteractiveListAction

/// All available `InteractiveList` module actions.
///
/// It's a type that represents all of the actions that can happen in `InteractiveList` feature,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum InteractiveListAction: Equatable {
    
    // MARK: - Cases
    
    /// An action that triggers an update to the list's items.
    case updateItems
    
    /// An action that triggers the addition of a random item to the list.
    case addRandom
    
    /// An action that triggers the removal of all checked items from the list.
    case removeCheckedItems
    
    /// An action that triggers the deletion of one or more items from the list.
    ///  The `IndexSet` parameter specifies the indices of the items to be deleted.
    case delete(IndexSet)
    
    /// An action that triggers a specific action on a single item in the list.
    /// The `id` parameter specifies the unique identifier of the item,
    /// and the `action` parameter represents the specific action to be performed on the item.
    case item(id: UUID, action: InteractiveListItemAction)
}

