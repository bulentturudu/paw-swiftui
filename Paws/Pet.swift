    //
    //  Pet.swift
    //  Paws
    //
    //  Created by Bülent TÜRÜDÜ on 15.07.2025.
    //

    import Foundation
    import SwiftData

    // MARK: - [+] BEGIN: Pet Model ------------------------->
    // Evcil hayvan modelini temsil eder. Ad ve fotoğraf verisi içerir.
    @Model
    final class Pet: Identifiable {
        var name: String // Evcil hayvanın adı
        @Attribute(.externalStorage) var photo: Data? // Fotoğraf verisi (harici depolama)

        init(name: String, photo: Data? = nil) {
            self.name = name
            self.photo = photo
        }
        //-- [-] END: Pet Model ------------------------->
    }

     // MARK: - [+] BEGIN: Preview ------------------------->
     // SwiftUI önizleme için bellek içi örnek veriler oluşturur
    extension Pet {
        @MainActor
        static var preview: ModelContainer {
            let configuration = ModelConfiguration(isStoredInMemoryOnly: true) // Bellek içi yapılandırma
            let container = try! ModelContainer(for: Pet.self, configurations: configuration) // Model konteyneri oluşturma


            container.mainContext.insert(Pet(name: "Rexy")) // Örnek pet ekleme
            container.mainContext.insert(Pet(name: "Bella")) // Örnek pet ekleme
            container.mainContext.insert(Pet(name: "Charlie")) // Örnek pet ekleme
            container.mainContext.insert(Pet(name: "Daisy")) // Örnek pet ekleme
            container.mainContext.insert(Pet(name: "Fido")) // Örnek pet ekleme
            container.mainContext.insert(Pet(name: "Gus")) // Örnek pet ekleme
            container.mainContext.insert(Pet(name: "Mimi")) // Örnek pet ekleme
            container.mainContext.insert(Pet(name: "Lunas")) // Örnek pet ekleme

            return container
        }
        //-- [-] END: Preview ------------------------->
    }
