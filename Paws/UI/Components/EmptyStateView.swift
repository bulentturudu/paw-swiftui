    //
    //  EmptyStateView.swift
    //  Paws
    //
    //  Created by Bülent TÜRÜDÜ on 15.07.2025.
    //

import SwiftUI

    // MARK: - [+] BEGIN: EmptyStateView ------------------------->
    // Boş veri durumlarında gösterilen özel görünüm (ikon, başlık ve açıklama)
struct EmptyStateView: View {
    var icon: String // Sistem ikonu adı
    var title: String // Başlık metni
    var description: String // Açıklama metni
    
        // MARK: - [+] BEGIN: Body ------------------------->
    var body: some View {
        ContentUnavailableView {
            Image(systemName: icon)
                .emptyStateImageStyle() // DesignTokens uyumlu özel image stili
            
            Text(title)
                .emptyStateTitleStyle() // DesignTokens tipografi & renk stili
        } description: {
            Text(description)
                .emptyStateDescriptionStyle() // DesignTokens tipografi & renk stili
        }
        .foregroundStyle(DesignTokens.Colors.textPrimary) // Metin rengi DesignTokens üzerinden
    }
        //-- [-] END: Body ------------------------->
        //-- [-] END: EmptyStateView ------------------------->
}

#Preview {
    EmptyStateView(
        icon: "cat.circle",
        title: "No Photo",
        description: "Add a photo to get started.")
}
