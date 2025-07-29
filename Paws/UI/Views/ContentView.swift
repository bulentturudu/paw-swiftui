    //
    //  ContentView.swift
    //  Paws
    //
    //  Created by Bülent TÜRÜDÜ on 13.07.2025.
    //

import SwiftUI
import SwiftData

    // MARK: - [+] BEGIN: ContentView ------------------------->
    // Ana ekran: Evcil hayvanların listelenmesi ve düzenlenmesi için grid yapısı içerir
struct ContentView: View {
        // MARK: - [+] BEGIN: State & Environment Değişkenleri ------------------------->
    @Environment(\.modelContext) var modelContext
    @Query private var pets: [Pet]

    @State private var path = [Pet]()
    @State private var isEditing: Bool = false
        //-- [-] END: State & Environment Değişkenleri -------------------------

    let layout = [
        GridItem(.flexible(minimum: 120)),
        GridItem(.flexible(minimum: 120))
    ]

        // MARK: - [+] BEGIN: Fonksiyonlar ------------------------->
        // Yeni pet ekleme işlemi
    func addPet () {
        isEditing = false
        let pet = Pet(name: "Yakın Dost")
        modelContext.insert(pet)
        path = []
    }
        //-- [-] END: Fonksiyonlar ------------------------->

        // MARK: - [+] BEGIN: Body ------------------------->
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView { // Ana kaydırma alanı
                LazyVGrid(columns: layout) { // Grid yapısı (2 sütun)
                    ForEach(pets) { pet in
                        NavigationLink(value: pet) {
                            PetCard(pet: pet, isEditing: isEditing) {
                                withAnimation {
                                    modelContext.delete(pet)
                                    try? modelContext.save()
                                }
                            }
                        }
                        .foregroundStyle(DesignTokens.Colors.textPrimary) // DesignTokens uyumu için renk değiştirildi
                    } //: LOOP
                } //:GRID LAYOUT
                .padding(.horizontal)
            }//:SCROLLVIEW
            .navigationTitle(pets.isEmpty ? "" : "Paws")
            .navigationDestination(for: Pet.self, destination: EditPetView.init)
                // MARK: - Toolbar (Üstteki düzenleme ve ekleme butonları)
            .toolbar {
                    // Düzenleme (Editing) modunu açıp kapatma butonu
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            isEditing.toggle()
                        }
                    } label: {
                        Label("Edit", systemImage: "slider.horizontal.3")
                    }
                }

                    // Yeni pet ekleme butonu
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: addPet) {
                        Label("Add a New Pet", systemImage: "plus.circle")
                    }
                }
            }
            .appToolbarStyle()

                //-- [-] END: Toolbar ------------------------->
                // MARK: - [+] BEGIN: Boş Ekran Görünümü ------------------------->
            .overlay {
                if pets.isEmpty {
                    EmptyStateView(
                        icon: "dog.circle",
                        title: "Evcil Hayvan Yok",
                        description: "Başlamak için evcil hayvan ekle.")

                }
            }
                //-- [-] END: Boş Ekran Görünümü ------------------------->
        }//: NAVSTACK
    }
        //-- [-] END: Body ------------------------->
}
    //-- [-] END: ContentView ------------------------->

#Preview("Sample Data") {
    ContentView()
        .modelContainer(Pet.preview)
}

#Preview("No Data") {
    ContentView()
        .modelContainer(for:Pet.self, inMemory:true)
}
