    //
    //  CardModifiers.swift
    //  Paws
    //
    //  Created by Bülent TÜRÜDÜ on 27.07.2025.
    //

    import SwiftUI

    // MARK: - CardModifiers
    // Genel kapsayıcı kart görünümü için ViewModifier.
    // DesignTokens'daki spacing, renk ve materyal değerleri kullanılarak
    // kartlar için tutarlı ve merkezi bir stil oluşturur.
    struct CardModifiers: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity) // Maksimum alanı kapla
                .background(DesignTokens.Materials.ultraThin)                                // Ultra ince materyal arka plan
                .clipShape(RoundedRectangle(cornerRadius: DesignTokens.Spacing.sm, style: .circular)) // Köşe yuvarlama DesignTokens'dan
                .foregroundStyle(DesignTokens.Colors.textPrimary)                            // Ön plan rengi DesignTokens uyumlu
        }
    }

    extension View {
        // Card görünümü için kolay kullanım extension'ı
        func cardStyle() -> some View {
            modifier(CardModifiers())
        }
    }
