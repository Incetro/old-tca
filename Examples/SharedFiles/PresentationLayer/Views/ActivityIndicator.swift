//
//  ActivityIndicator.swift
//  verse-swiftui-examples
//
//  Created by incetro on 10/14/21.
//

import SwiftUI

// MARK: - ActivityIndicator

public struct ActivityIndicator: View {

    // MARK: - View

    public var body: some View {
        UIViewRepresented { _ in
            let view = UIActivityIndicatorView()
            view.startAnimating()
            return view
        }
    }
}
