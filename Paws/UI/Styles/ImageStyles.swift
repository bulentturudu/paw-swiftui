    //
    //  ImageModifiers.swift
    //  Paws
    //
    //  Created by Bülent TÜRÜDÜ on 27.07.2025.
    //

    import SwiftUI

    // MARK: - Private Base Image Style Extension
    private extension Image {
        /// Tüm Image stillerinin temelini oluşturan, resmi yeniden boyutlandıran ve uyumlu ölçeklendiren stil
        func baseResizableStyle() -> some View {
            self
                .resizable()
                .scaledToFit()
        }
    }

    // MARK: - Public Image Style Extensions
    extension Image {

        /// Evcil hayvan resmi için özel stil
        func petImageStyle() -> some View {
            baseResizableStyle()
                .clipShape(RoundedRectangle(cornerRadius: DesignTokens.Spacing.sm, style: .circular))
        }

        /// Evcil hayvan ikonu için varsayılan stil
        /// DesignTokens içerisindeki renk ve spacing kullanılarak tutarlı görünüm sağlanır
        func defaultPetIconStyle() -> some View {
            baseResizableStyle()
                .padding(DesignTokens.Spacing.xl)
                .foregroundStyle(DesignTokens.Colors.textSecondary) // DesignTokens uyumu
        }

        // MARK: - Empty State Image Style

        /// Boş durum (empty state) için kullanılan stil
        /// Görsel genişliği 96pt olarak sabitlenir
        func emptyStateImageStyle() -> some View {
            baseResizableStyle()
                .frame(width: 96)
        }

        /// Edit sayfasında kullanılan pet resmi stili
        func petEditImageStyle() -> some View {
            baseResizableStyle()
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300)
                .padding(.top)
        }
    }
