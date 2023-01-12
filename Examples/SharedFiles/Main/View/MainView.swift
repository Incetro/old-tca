//
//  MainView.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import SwiftUI

// MARK: - MainView

/// A visual representation of `Main` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<MainState, MainAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct MainView: View {

    // MARK: - Properties

    /// MainStore instance
//    private let store: MainStore

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - store: MainStore instance
//    public init(store: MainStore) {
//        self.store = store
//    }

    // MARK: - View

    public var body: some View {
//        WithViewStore(store.stateless) { viewStore in
            NavigationView {
                Form {
                    Section(header: Text("👶🏻 Beginner")) {
                        NavigationLink(
                            destination: EmptyView()
                        ) {
                            Text("Basics").standard
                        }
                    }
                    Section(header: Text("💡 Elementary")) {
                    }
                    Section(header: Text("🙋🏻‍♂️ Pre Intermediate")) {
                    }
                    Section(header: Text("👨🏻‍💻 Intermediate")) {
                    }
                    Section(header: Text("👨🏻‍🏫 Upper intermediate")) {
                    }
                    Section(header: Text("👨🏻‍🎓 Advanced")) {
                    }
                    Section(header: Text("🥷🏻 Proficient")) {
                    }
                }
                .navigationBarTitle("TCA")
//                .onAppear { viewStore.send(.onAppear) }
            }
//        }
    }
}

let globalFontSize: CGFloat = 17
