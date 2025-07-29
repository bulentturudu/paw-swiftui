    //
    //  EditPetView.swift
    //  Paws
    //
    //  Created by Bülent TÜRÜDÜ on 16.07.2025.
    //

import SwiftUI
import SwiftData
import PhotosUI

    // MARK: - [+] BEGIN: EditPetView ------------------------->
    // Evcil hayvan düzenleme ekranı: fotoğraf ekleme ve isim düzenleme
struct EditPetView: View {
        // MARK: - [+] BEGIN: State & Environment Değişkenleri ------------------------->
    @Environment(\.dismiss) private var dismiss
    @Bindable var pet: Pet
    @State private var photosPickerItem: PhotosPickerItem?
        //-- [-] END: State & Environment Değişkenleri ------------------------->
    
        // MARK: - [+] BEGIN: Body ------------------------->
    var body: some View {
        Form {
                // MARK: - IMAGE
            if let imageData = pet.photo { // Fotoğraf varsa göster
                if let image = UIImage(data: imageData) {
                    Image(uiImage: image)
                        .petEditImageStyle() // DesignTokens uyumlu özel image stili
                }
            } else { // Fotoğraf yoksa özel boş görünüm göster
                EmptyStateView(
                    icon: "pawprint.circle",
                    title: "Fotoğraf Bulunamadı",
                    description: "Favori evcil hayvanınızın fotoğrafını ekleyin, onu bulmanız kolaylaşır"
                )
                .padding(.top, DesignTokens.Spacing.md) // DesignTokens spacing
            }
            
                // MARK: - PHOTO PICKER
            PhotosPicker(selection: $photosPickerItem, matching: .images) {
                    // Fotoğraf seçme butonu
                Label("Fotoğraf Seç", systemImage: "photo.badge.plus")
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .buttonStyle(PhotoPickerButtonStyle())
            .listRowSeparator(.hidden)
            
                // MARK: - TEXT FIELD
            TextField("Name", text: $pet.name) // Pet adı düzenleme alanı
                .editPetTextFieldStyle() // DesignTokens tipografi ve padding
            
                // MARK: - SAVE BUTTON
            SaveButton {
                dismiss()
            }
            .listRowSeparator(.hidden) // Liste ayırıcısını gizle
            .padding(.bottom, DesignTokens.Spacing.lg) // DesignTokens spacing
            
                //-- [-] END: Body İçerik Alanı ------------------------->
        } //: FORM
        .listStyle(.plain)
        .navigationTitle("Düzenle \(pet.name)")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
            // MARK: - [+] BEGIN: Toolbar ------------------------->
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("İptal", role: .cancel) {
                    dismiss()
                }
                .tint(DesignTokens.Colors.buttonCancelTint)
            }
        }
            //-- [-] END: Toolbar ------------------------->
            // MARK: - [+] BEGIN: Fotoğraf Değişim İzleme ------------------------->
        .onChange(of: photosPickerItem) {
            Task {
                pet.photo = try? await photosPickerItem?.loadTransferable(type: Data.self)
            }
        }
            //-- [-] END: Fotoğraf Değişim İzleme ------------------------->
            //-- [-] END: Body ------------------------->
    }
}
    //-- [-] END: EditPetView ------------------------->

#Preview {
    NavigationStack {
        do {
            let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Pet.self, configurations: configuration)
            let sampleData = Pet(name: "Daisy")
            
            return EditPetView(pet: sampleData)
                .modelContainer(container)
            
        } catch {
            fatalError("Couldnot load preview data. \(error.localizedDescription)")
            
        }
    }
}
