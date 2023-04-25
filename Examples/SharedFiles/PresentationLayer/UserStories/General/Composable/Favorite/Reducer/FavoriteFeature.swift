//
//  FavoriteFeature.swift
//  tca-university-swiftui
//
//  Created by Kazakh on 24.04.2023.
//

import TCA
import Foundation

// MARK: - FavoriteFeature

public struct FavoriteFeature<ID: Hashable>: ReducerProtocol {
    
    // MARK: - Properties
    
    /// FavoriteService instance
    public let refresher: (ID, Bool) -> Effect<Bool, Error>
    
    // MARK: - Feature
    
    public var body: some ReducerProtocol<FavoriteState<ID>, FavoriteAction> {
        Reduce { state, action in
            switch action {
            case .alertDismissed:
                state.alert = nil
                state.isFavorite.toggle()
                return .none
            case .favoriteButtonTapped:
                state.isFavorite.toggle()
                return refresher(state.id, state.isFavorite)
                    .receive(on: DispatchQueue.main)
                    .mapError { FavoriteError(error: $0 as NSError) }
                    .catchToEffect(FavoriteAction.response)
                    .cancellable(id: FavoriteCancelID(id: state.id), cancelInFlight: true)
            case let .response(.failure(error)):
                state.alert = .init(title: TextState(error.localizedDescription))
                return .none
            case .response(.success(let isFavorite)):
                state.isFavorite = isFavorite
                return .none
            }
        }
    }
}

// MARK: - FavoriteCancelID

/// A cancellation token that cancels in-flight favoriting requests.
private struct FavoriteCancelID<ID>: Hashable where ID: Hashable {

    // MARK: - Properties

    let id: ID
}
