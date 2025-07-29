    //
    //  DesignTokens.swift
    //  Paws
    //
    //  Created by Bülent TÜRÜDÜ on 27.07.2025.
    //

    import SwiftUI

    struct DesignTokens {

        // MARK: - Colors (Asset-based pastel palette)
        /*
         | Token               | Kullanım Durumu                              |
         |---------------------|---------------------------------------------|
         | BrandPrimary        | Uygulamanın ana vurgulu rengi (butonlar vb.)|
         | BrandSuccess        | Başarı durumları (örn. kayıt tamamlandı)    |
         | BrandWarning        | Uyarı renkleri (örneğin dikkat çekmek için) |
         | BrandDanger         | Hata, silme gibi kritik uyarılar            |
         | BrandInfo           | Bilgilendirme kartları, banner'lar          |
         | BrandBackground     | Genel arka plan rengi                        |
         | BrandSurface        | Kartlar, yüzeyler için arka plan             |
         | BrandIconPrimary    | Özel ikon rengi                              |
         | BrandIconSecondary  | Alternatif ikon rengi                        |
         | BrandTextPrimary    | Ana metin rengi                             |
         | BrandTextSecondary  | İkincil metin rengi                         |
         | BrandTextMuted      | Daha pasif, açıklayıcı metin                 |
         | toolbarTint         | Toolbar ikon tint rengi                      |
         | buttonCancelTint    | Cancel buton tint rengi                      |
         */

        struct Colors {
            static let primary = Color("BrandPrimary")
            static let success = Color("BrandSuccess")
            static let warning = Color("BrandWarning")
            static let danger  = Color("BrandDanger")
            static let info    = Color("BrandInfo")
            static let background = Color("BrandBackground")
            static let surface = Color("BrandSurface")

            // Icon Colors
            static let iconPrimary = Color("BrandIconPrimary")
            static let iconSecondary = Color("BrandIconSecondary")

            // Text Colors
            static let textPrimary = Color("BrandTextPrimary")
            static let textSecondary = Color("BrandTextSecondary")
            static let textMuted = Color("BrandTextMuted")

            // Tint
            static let toolbarTint = Color("BrandIconPrimary")
            static let buttonCancelTint = Color("buttonCancelTint")
        }

        // MARK: - Typography (Tailwind-like scale and weights)
        /*
         Font sizes are based on a scale similar to Tailwind CSS.
         Font weights reflect standard SwiftUI weights.
        */
        struct Typography {
            static let xs = Font.system(size: 12)
            static let sm = Font.system(size: 14)
            static let base = Font.system(size: 16)
            static let lg = Font.system(size: 18)
            static let xl = Font.system(size: 20)
            static let xl2 = Font.system(size: 24)
            static let xl3 = Font.system(size: 30)
            static let xl4 = Font.system(size: 36)

            static let thin = Font.Weight.thin
            static let light = Font.Weight.light
            static let regular = Font.Weight.regular
            static let medium = Font.Weight.medium
            static let semibold = Font.Weight.semibold
            static let bold = Font.Weight.bold
            static let heavy = Font.Weight.heavy
        }

        // MARK: - Spacing (Tailwind-like scale)
        /*
         Standard spacing values for padding/margin.
        */
        struct Spacing {
            static let xs: CGFloat = 4
            static let sm: CGFloat = 8
            static let md: CGFloat = 12
            static let lg: CGFloat = 16
            static let xl: CGFloat = 20
            static let xl2: CGFloat = 24
            static let xl3: CGFloat = 32
            static let xl4: CGFloat = 40
            static let xl5: CGFloat = 48
        }

        // MARK: - Border Radius
        /*
         Standard border radius sizes.
        */
        struct BorderRadius {
            static let none: CGFloat = 0
            static let sm: CGFloat = 4
            static let base: CGFloat = 6
            static let md: CGFloat = 8
            static let lg: CGFloat = 12
            static let xl: CGFloat = 16
            static let full: CGFloat = 999
        }

        // MARK: - Shadows
        /*
         Standard shadow colors with opacity.
        */
        struct Shadows {
            static let sm = Color.black.opacity(0.05)
            static let base = Color.black.opacity(0.1)
            static let md = Color.black.opacity(0.15)
            static let lg = Color.black.opacity(0.25)
            static let xl = Color.black.opacity(0.25)
        }

        // MARK: - Materials (SwiftUI Material Styles)
        /*
         Common SwiftUI material styles for backgrounds.
        */
        struct Materials {
            static let ultraThin = Material.ultraThin
            static let thin = Material.thin
            static let regular = Material.regular
        }
    }
