    //
    //  CustomContentUnavaibleView.swift
    //  Paws
    //
    //  Created by Bülent TÜRÜDÜ on 15.07.2025.
    //

    import SwiftUI

    // MARK: - [+] BEGIN: CustomContentUnavailableView ------------------------->
    // Boş veri durumlarında gösterilen özel görünüm (ikon, başlık ve açıklama)
    struct CustomContentUnavaibleView: View {
        var icon: String // Sistem ikonu adı
        var title: String // Başlık metni
        var description: String // Açıklama metni
        // MARK: - [+] BEGIN: Body ------------------------->
        var body: some View {
            ContentUnavailableView { // SwiftUI hazır ContentUnavailableView bileşeni
                Image(systemName: icon) // Belirtilen SF Symbol ikonunu göster
                    .resizable()
                    .scaledToFit()
                    .frame(width: 96)

                Text(title) // Başlığı göster
                    .font(.title)
            } description: {
                Text(description) // Açıklamayı göster
            }
            .foregroundStyle(.tertiary)
        }
        //-- [-] END: Body ------------------------->
        //-- [-] END: CustomContentUnavailableView ------------------------->
    }

    #Preview {
        CustomContentUnavaibleView(
            icon: "cat.circle",
            title: "No Photo",
            description: "Add a photo to get started.")
    }


