//
//  ButtonStylesPreviews.swift
//  Paws
//
//  Created by Bülent TÜRÜDÜ on 29.07.2025.
//

import SwiftUI

    // MARK: - SaveButtonStyle Preview
    #if DEBUG
    #Preview("SaveButtonStyle") {
        Button("Save") { }
            .buttonStyle(SaveButtonStyle())
            .padding()
    }

    // MARK: - DeleteButtonStyle Preview
    #Preview("DeleteButtonStyle") {
        Image(systemName: "trash")
            .deleteButtonStyle()
            .padding()
    }

    // MARK: - PhotoPickerButtonStyle Preview
    #Preview("PhotoPickerButtonStyle") {
        Button(action: {}) {
            Label("Select a Photo", systemImage: "photo.badge.plus")
        }
        .buttonStyle(PhotoPickerButtonStyle())
        .padding()
    }

    // MARK: - CancelButtonStyle Preview
#Preview("CancelButtonStyle"){
        Button("Cancel") { }
            .buttonStyle(CancelButtonStyle())
            .padding()
}
    #endif

