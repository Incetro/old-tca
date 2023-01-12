//
//  Text.swift
//  verse-swiftui-examples
//
//  Created by incetro on 2/9/22.
//

import SwiftUI

// MARK: - Text

extension Text {

    init(template: String) {

        enum Style: Hashable {
            case code
            case emphasis
            case strong
        }

        var segments: [Text] = []
        var currentValue = ""
        var currentStyles: Set<Style> = []

        func flushSegment() {
            var text = Text(currentValue)
            if currentStyles.contains(.code) {
                text = text
                    .font(.system(size: globalFontSize, design: .monospaced))
                    .foregroundColor(.accentColor)
            }
            if currentStyles.contains(.emphasis) {
                text = text
                    .font(.system(size: globalFontSize))
                    .italic()
            }
            if currentStyles.contains(.strong) {
                text = text
                    .font(.system(size: globalFontSize))
                    .bold()
            }
            segments.append(text)
            currentValue.removeAll()
        }

        for character in template {
            switch character {
            case "*":
                flushSegment()
                currentStyles.toggle(.strong)
            case "_":
                flushSegment()
                currentStyles.toggle(.emphasis)
            case "`":
                flushSegment()
                currentStyles.toggle(.code)
            default:
                currentValue.append(character)
            }
        }
        flushSegment()

        self = segments.reduce(Text(""), +)
    }
}

extension Set {
    fileprivate mutating func toggle(_ element: Element) {
        if self.contains(element) {
            self.remove(element)
        } else {
            self.insert(element)
        }
    }
}
