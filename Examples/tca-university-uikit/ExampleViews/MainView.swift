//
//  MainView.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import SwiftUI
import OldTCA

// MARK: - MainView

public struct MainView: View {

    // MARK: - Properties

    let store: StoreOf<MainFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store.stateless) { viewStore in
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
                .onAppear { viewStore.send(.onAppear) }
            }
        }
    }
}

let globalFontSize: CGFloat = 17
