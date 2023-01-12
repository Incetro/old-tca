//
//  UIViewRepresented.swift
//  verse-swiftui-examples
//
//  Created by incetro on 10/14/21.
//

import SwiftUI

// MARK: - UIViewRepresented

struct UIViewRepresented<UIViewType>: UIViewRepresentable where UIViewType: UIView {

    // MARK: - Properties

    let makeUIView: (Context) -> UIViewType
    let updateUIView: (UIViewType, Context) -> Void = { _, _ in }

    // MARK: - UIViewRepresentable

    func makeUIView(context: Context) -> UIViewType {
        makeUIView(context)
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        updateUIView(uiView, context)
    }
}
