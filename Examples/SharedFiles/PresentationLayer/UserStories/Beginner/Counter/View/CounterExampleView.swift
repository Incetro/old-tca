//
//  CounterExampleView.swift
//  verse-swiftui-examples
//
//  Created by incetro on 10/13/21.
//

import TCA
import SwiftUI

// MARK: - CounterExampleView

/// Example (full screen) example view
public struct CounterExampleView: View {

    // MARK: - Properties

    /// The store powering the `Counter` feature
    public let store: StoreOf<CounterFeature>

    // MARK: - View

    public var body: some View {
        Form {
            Section(header: Text(template: Constants.summary).standard) {
                CounterView(store: store)
                    .buttonStyle(BorderlessButtonStyle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }.textCase(nil)
        }
        .navigationBarTitle("Basics")
    }
}

// MARK: - Constants

extension CounterExampleView {

    enum Constants {

        static let summary = """
        This screen shows the simplest example of the TCA architecture based on a regular counter.

        The business logic of the application is designed using simple data types that can change the state \
        of the application and any actions that may affect this state or the outside world.

        """
    }
}
