    //
    //  TextModifiers.swift
    //  Paws
    //
    //  Created by Bülent TÜRÜDÜ on 27.07.2025.
    //

import SwiftUI

    // MARK: - Pet Name Text Style
    // Evcil hayvan adını gösteren metin için stil
    // DesignTokens'dan tipografi ve renk kullanarak tutarlı görünüm sağlanır
struct PetNameTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(DesignTokens.Typography.xl.weight(.semibold))         // Başlık büyüklüğünde, yarı kalın font
            .padding(.vertical, DesignTokens.Spacing.md)                // Dikey padding
            .foregroundColor(DesignTokens.Colors.textPrimary)           // Birincil metin rengi
    }
}

extension View {
    func petNameTextStyle() -> some View {
        modifier(PetNameTextModifier())
    }
}

    // MARK: - Empty State Title Style
    // Boş durum ekranında başlık metni için stil
    // DesignTokens kullanarak font ve renkler ayarlandı
struct EmptyStateTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(DesignTokens.Typography.xl2.weight(.semibold))        // Büyük başlık fontu
            .foregroundColor(DesignTokens.Colors.textPrimary)           // Birincil metin rengi
    }
}

    // MARK: - Empty State Description Style
    // Boş durum ekranında açıklama metni için stil
    // DesignTokens ile renk, hizalama ve padding verildi
struct EmptyStateDescriptionStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(DesignTokens.Typography.base)                         // Normal metin fontu
            .foregroundColor(DesignTokens.Colors.textSecondary)         // İkincil metin rengi
            .multilineTextAlignment(.center)                             // Ortalanmış çok satırlı metin
            .padding(.horizontal, DesignTokens.Spacing.md)              // Yatay padding
    }
}

extension View {
    func emptyStateTitleStyle() -> some View {
        self.modifier(EmptyStateTitleStyle())
    }

    func emptyStateDescriptionStyle() -> some View {
        self.modifier(EmptyStateDescriptionStyle())
    }
}

    // MARK: - Edit Pet TextField Style
    // Evcil hayvan düzenleme ekranındaki TextField için stil
    // DesignTokens'dan font ve padding değerleri kullanılır
struct EditPetTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)                              // Yuvarlak kenarlı standart textfield stili
            .font(DesignTokens.Typography.xl.weight(.light))            // Hafif ağırlıklı büyük font
            .padding(.vertical, DesignTokens.Spacing.md)                 // Dikey padding
    }
}

extension View {
    func editPetTextFieldStyle() -> some View {
        self.modifier(EditPetTextFieldStyle())
    }
}
