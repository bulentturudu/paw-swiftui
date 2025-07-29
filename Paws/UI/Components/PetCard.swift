    //
    //  PetCard.swift
    //  Paws
    //
    //  Created by Bülent TÜRÜDÜ on 27.07.2025.
    //

    import SwiftUI

    // MARK: - PetCard
    // Bir evcil hayvanı temsil eden kart bileşeni.
    // İçerik: fotoğraf veya varsayılan ikon, evcil hayvan adı ve isteğe bağlı silme menüsü.
    // DesignTokens ile tutarlı stil ve düzen uygulanır.
    struct PetCard: View {
        let pet: Pet           // Kartta gösterilecek Pet modeli
        let isEditing: Bool    // Düzenleme modu aktif mi?
        let onDelete: () -> Void // Silme işlemi için callback

        var body: some View {
            // Card kapsayıcısı: DesignTokens.cardStyle() ile stil verilen kapsayıcı
            Card {
                VStack {
                    // MARK: - PET IMAGE
                    if let imagedata = pet.photo, let image = UIImage(data: imagedata) {
                        Image(uiImage: image)
                            .petImageStyle() // DesignTokens uyumlu özel image stili
                    } else {
                        Image(systemName: "pawprint.circle")
                            .defaultPetIconStyle() // Boş pet resmi için varsayılan ikon stili
                    }
                    
                    Spacer()

                    // MARK: - PET NAME
                    Text(pet.name)
                        .petNameTextStyle() // DesignTokens uyumlu özel tipografi

                    Spacer()
                }
                // MARK: - DELETE MENU
                .overlay(alignment: .topTrailing) {
                    if isEditing {
                        Menu {
                            // Silme işlemi için menü butonu
                            Button("Delete", systemImage: "trash", role: .destructive, action: onDelete)
                        } label: {
                            Image(systemName: "trash.circle.fill")
                                .deleteButtonStyle() // DesignTokens uyumlu delete ikon stili
                        }
                    }
                }
            }
        }
    }

    // MARK: - Previews
    // Farklı durumlar için çoklu preview:
    // 1. Fotoğraf var ve düzenleme açık
    // 2. Fotoğraf yok ve düzenleme kapalı
    #Preview("PetCard - With Image, Editing On") {
        PetCard(
            pet: Pet(name: "Mia", photo: UIImage(named: "examplePet")?.pngData()),
            isEditing: true,
            onDelete: { print("Deleted") }
        )
    }

    #Preview("PetCard - No Image, Editing Off") {
        PetCard(
            pet: Pet(name: "Loki", photo: nil),
            isEditing: false,
            onDelete: { }
        )
    }
