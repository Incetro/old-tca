//
//  ProgressRingView.swift
//  tca-examples
//
//  Created by incetro on 12/12/23.
//

import SwiftUI

// MARK: - ProgressRingView

public struct ProgressRingView: View {

    // MARK: - Properties

    /// Current line width
    private let lineWidth: CGFloat

    /// Current progress value
    private let progress: CGFloat

    /// Start gradient color
    private let startColor: Color

    /// End gradient color
    private let endColor: Color

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - progress: current progress value
    ///   - startColor: start gradient color
    ///   - endColor: end gradient color
    public init(
        progress: CGFloat,
        lineWidth: CGFloat = 21,
        startColor: Color = .green,
        endColor: Color = .blue
    ) {
        self.lineWidth = lineWidth
        self.progress = progress
        self.startColor = startColor
        self.endColor = endColor
    }

    // MARK: - View

    public var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.31)
                .foregroundColor(.secondary)
            Circle()
                .trim(
                    from: 0,
                    to: CGFloat(min(progress, 1))
                )
                .stroke(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [startColor, endColor]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    style: StrokeStyle(
                        lineWidth: lineWidth,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                .rotationEffect(Angle(degrees: 270))
        }
    }
}
