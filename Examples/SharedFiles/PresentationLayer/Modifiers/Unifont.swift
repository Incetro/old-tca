//
//  Unifont.swift
//  verse-swiftui-examples
//
//  Created by incetro on 10/14/21.
//

import SwiftUI

// MARK: - Unifont

struct Unifont: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.system(size: globalFontSize, design: .default))
    }
}

// MARK: - UnifontSemibold

struct UnifontSemibold: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.system(size: globalFontSize, weight: .semibold, design: .default))
    }
}

// MARK: - View

extension View {

    var standard: some View {
        modifier(Unifont())
    }

    var semibold: some View {
        modifier(UnifontSemibold())
    }

    var semiboldSection: some View {
        font(.system(size: 22, weight: .semibold))
    }
}
