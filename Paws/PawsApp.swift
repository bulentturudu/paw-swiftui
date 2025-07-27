    //
    //  PawsApp.swift
    //  Paws
    //
    //  Created by Bülent TÜRÜDÜ on 13.07.2025.
    //

    import SwiftUI
    import SwiftData

    // MARK: - [+] BEGIN: PawsApp ------------------------->
    // Uygulamanın giriş noktası: ContentView ile başlar ve SwiftData model konteyneri oluşturur
    @main
    struct PawsApp: App {
        var body: some Scene {
            WindowGroup {
                ContentView()
                    .modelContainer(for: Pet.self) // SwiftData model konteyneri (Pet modeli için)

            }
        }
    }
    //-- [-] END: PawsApp ------------------------->
