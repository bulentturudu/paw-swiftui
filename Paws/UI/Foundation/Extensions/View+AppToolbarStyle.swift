//
//  View+AppToolbarStyle.swift
//  Paws
//
//  Created by Bülent TÜRÜDÜ on 29.07.2025.
//

    // View+AppToolbarStyle.swift
    import SwiftUI

    extension View {
        func appToolbarStyle() -> some View {
            self.tint(DesignTokens.Colors.toolbarTint)
        }
    }
