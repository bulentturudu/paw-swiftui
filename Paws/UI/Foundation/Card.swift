    //
    //  Card.swift
    //  Paws
    //
    //  Created by Bülent TÜRÜDÜ on 28.07.2025.
    //

    import SwiftUI

    // MARK: - Card Container
    // Genel amaçlı kapsayıcı view. İçeriği alır ve DesignTokens üzerinden tanımlı cardStyle() modifier ile stil verir.
    // Böylece projedeki tüm kartlar tutarlı görünür ve stil merkezi olarak yönetilir.

    struct Card<Content: View>: View {
        let content: Content

        // ViewBuilder sayesinde içerik closure ile verilebilir.
        init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }

        var body: some View {
            content
                .cardStyle() // DesignTokens uyumlu card görünümü
        }
    }
