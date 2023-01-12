//
//  ActivityIndicator.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
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
