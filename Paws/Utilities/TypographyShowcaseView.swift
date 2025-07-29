//
//  TypographyShowcaseView.swift
//  Paws
//
//  Created by Bülent TÜRÜDÜ on 29.07.2025.
//

import SwiftUI

struct TypographyShowcaseView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Group {
                    Text("XL4 Bold")
                        .font(DesignTokens.Typography.xl4.weight(.bold))
                    Text("XL3 Semibold")
                        .font(DesignTokens.Typography.xl3.weight(.semibold))
                    Text("XL2 Semibold")
                        .font(DesignTokens.Typography.xl2.weight(.semibold))
                    Text("XL Bold")
                        .font(DesignTokens.Typography.xl.weight(.bold))
                }
                Group {
                    Text("Large Medium")
                        .font(DesignTokens.Typography.lg.weight(.medium))
                    Text("Base Regular")
                        .font(DesignTokens.Typography.base.weight(.regular))
                    Text("Small Light")
                        .font(DesignTokens.Typography.sm.weight(.light))
                    Text("Extra Small Thin")
                        .font(DesignTokens.Typography.xs.weight(.thin))
                }
            }
            .padding()
        }
        .navigationTitle("Typography Showcase")
    }
}

#Preview("Typography Showcase", traits: .sizeThatFitsLayout) {
    TypographyShowcaseView()
}
