//
//  ColorShowcaseView.swift
//  Paws
//
//  Created by Bülent TÜRÜDÜ on 29.07.2025.
//

import SwiftUI

struct ColorShowcaseView: View {
    let colors: [(name: String, color: Color)] = [
        ("Primary", DesignTokens.Colors.primary),
        ("Success", DesignTokens.Colors.success),
        ("Warning", DesignTokens.Colors.warning),
        ("Danger", DesignTokens.Colors.danger),
        ("Info", DesignTokens.Colors.info),
        ("Background", DesignTokens.Colors.background),
        ("Surface", DesignTokens.Colors.surface),
        ("TextPrimary", DesignTokens.Colors.textPrimary),
        ("TextSecondary", DesignTokens.Colors.textSecondary),
        ("TextMuted", DesignTokens.Colors.textMuted),
        ("IconPrimary", DesignTokens.Colors.iconPrimary),
        ("IconSecondary", DesignTokens.Colors.iconSecondary)
    ]

    var body: some View {
        ScrollView {
            ForEach(colors, id: \.name) { item in
                HStack {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(item.color)
                        .frame(width: 50, height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.gray.opacity(0.2)))
                    Text(item.name)
                        .font(.headline)
                        .padding(.leading, 8)
                    Spacer()
                }
                .padding()
            }
        }
        .background(DesignTokens.Colors.background)
        .navigationTitle("Color Showcase")
    }
}

#Preview("Color Showcase", traits: .sizeThatFitsLayout) {
    ColorShowcaseView()
}
