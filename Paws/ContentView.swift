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
        let pet = Pet(name: "Best Friend")
        modelContext.insert(pet)
        path = []
    }
    //-- [-] END: Fonksiyonlar ------------------------->
    
    // MARK: - [+] BEGIN: Body ------------------------->
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView { // Ana kaydırma alanı
                LazyVGrid(columns: layout) { // Grid yapısı (2 sütun)
                    GridRow { // Grid satırı, tüm pet kartlarını içerir
                        ForEach(pets) { pet in
                            NavigationLink(value: pet) {
                                VStack {
                                    if let imagedata = pet.photo { // Pet için fotoğraf varsa göster
                                        if let image = UIImage(data: imagedata) {
                                            Image(uiImage: image)
                                                .resizable()
                                                .scaledToFit()
                                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))

                                        }
                                    } else { // Fotoğraf yoksa varsayılan ikon
                                        Image(systemName: "pawprint.circle")
                                            .resizable()
                                            .scaledToFit()
                                            .padding(40)
                                            .foregroundStyle(.quaternary)
                                    }
                                    Spacer()

                                    Text(pet.name)
                                        .font(.title.weight(.light))
                                        .padding(.vertical)

                                    Spacer()
                                } //:VSTACK
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                                .overlay(alignment: .topTrailing) {
                                    if isEditing { // Düzenleme modundaysak silme menüsünü göster
                                        Menu { // Silme işlemi menü butonu
                                            Button("Delete", systemImage: "trash", role: .destructive){
                                                withAnimation {
                                                    modelContext.delete(pet)
                                                    try? modelContext.save()
                                                }

                                            }
                                        } label: {
                                            Image(systemName: "trash.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 32, height: 32)
                                                .foregroundStyle(.red)
                                                .padding()
                                                .symbolRenderingMode(.multicolor)
                                        }
                                    }
                                }
                            } //: NAVLINK
                            .foregroundStyle(.primary)
                        } //: LOOP
                    } //: GRIDROW
                } //:GRID LAYOUT
                .padding(.horizontal)
            }//:SCROLLVIEW
            .navigationTitle(pets.isEmpty ? "" : "Paws")
            .navigationDestination(for: Pet.self, destination: EditPetView.init)
            // MARK: - [+] BEGIN: Toolbar ------------------------->
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            isEditing.toggle()
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }


                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add a New Pet", systemImage: "plus.circle", action: addPet)
                }
            }
            //-- [-] END: Toolbar ------------------------->
            // MARK: - [+] BEGIN: Boş Ekran Görünümü ------------------------->
            .overlay {
                if pets.isEmpty {
                    CustomContentUnavaibleView(
                        icon: "dog.circle",
                        title: "No Pets",
                        description: "Add a new pet to get started.")

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
