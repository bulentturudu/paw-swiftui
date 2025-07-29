    //
    //  Buttons.swift
    //  Paws
    //
    //  Created by Bülent TÜRÜDÜ on 27.07.2025.
    //

import SwiftUI

    // MARK: - DeleteButton
    // Silme işlemi için kullanılan buton bileşeni.
    // İçinde çöp kutusu ikonu var ve stil olarak ButtonModifiers içindeki 'deleteButtonStyle' modifier'ını kullanır.
    // Stil, DesignTokens'daki 'destructive' renk ve spacing değerleriyle uyumludur.
struct DeleteButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "trash.circle.fill")
                .deleteButtonStyle() // ButtonModifiers içinden stil uygulanıyor
        }
    }
}

    // MARK: - SaveButton
    // Kaydetme işlemi için kullanılan buton bileşeni.
    // İçindeki metin varsayılan olarak "Save", ancak istenirse başlık değiştirilebilir.
    // Stil olarak ButtonStyles içindeki 'SaveButtonStyle' kullanılır.
    // SaveButtonStyle, DesignTokens'daki font, renk, padding ve radius değerlerine göre tasarlanmıştır.
struct SaveButton: View {
    var title: String = "Kaydet"
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
        }
        .buttonStyle(SaveButtonStyle()) // ButtonStyles'tan stil uygulanıyor
    }
}


    // MARK: - PhotoPickerButton
    // Fotoğraf seçmek için kullanılan buton bileşeni.
    // Stil olarak PhotoPickerButtonStyle kullanır.
struct PhotoPickerButton: View {
    var title: String = "Select a Photo"
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Label(title, systemImage: "photo.badge.plus")
        }
        .buttonStyle(PhotoPickerButtonStyle())
    }
}


    // MARK: - CancelButton
    // İptal (Cancel) işlemi için kullanılan buton bileşeni.
    // İçerik olarak buton metni alır ve stil olarak ButtonStyles içindeki 'CancelButtonStyle' kullanılır.
    // DesignTokens üzerinden renk, font, spacing ve radius değerleri ile uyumludur.
struct CancelButton: View {
    var title: String = "Cancel"
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
        }
        .buttonStyle(CancelButtonStyle())
    }
}
