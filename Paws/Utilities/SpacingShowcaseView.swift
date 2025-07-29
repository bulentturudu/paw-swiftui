//
//  SpacingShowcaseView.swift
//  Paws
//
//  Created by Bülent TÜRÜDÜ on 29.07.2025.
//

import SwiftUI

struct SpacingShowcaseView: View {
    let spacings: [(name: String, value: CGFloat)] = [
        ("xs (4)", DesignTokens.Spacing.xs),
        ("sm (8)", DesignTokens.Spacing.sm),
        ("md (12)", DesignTokens.Spacing.md),
        ("lg (16)", DesignTokens.Spacing.lg),
        ("xl (20)", DesignTokens.Spacing.xl),
        ("xl2 (24)", DesignTokens.Spacing.xl2),
        ("xl3 (32)", DesignTokens.Spacing.xl3),
        ("xl4 (40)", DesignTokens.Spacing.xl4),
        ("xl5 (48)", DesignTokens.Spacing.xl5)
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(spacings, id: \.name) { spacing in
                    VStack(alignment: .leading) {
                        Text(spacing.name)
                            .font(.headline)
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.blue.opacity(0.3))
                            .frame(height: 30)
                            .padding(spacing.value)
                            .background(Color.gray.opacity(0.15))
                            .overlay(
                                Text("\(Int(spacing.value))pt padding")
                                    .foregroundColor(.blue)
                                    .font(.caption)
                                    .padding(.leading, 8),
                                alignment: .leading
                            )
                    }
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                }
            }
            .padding()
        }
        .background(DesignTokens.Colors.background)
        .navigationTitle("Spacing Showcase")
    }
}

#Preview("Spacing Showcase", traits: .sizeThatFitsLayout) {
    SpacingShowcaseView()
}
