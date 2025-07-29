    //
    //  ButtonModifiers.swift
    //  Paws
    //
    //  Created by Bülent TÜRÜDÜ on 27.07.2025.
    //

    import SwiftUI

    // MARK: - Image Extension for Delete Button Style
    // Silme butonundaki çöp kutusu ikonunun görünümünü ayarlar.
    // DesignTokens içindeki 'destructive' renk ve spacing değerleri kullanılarak tutarlı ve merkezi stil yönetimi sağlanır.
    extension Image {
        func deleteButtonStyle() -> some View {
            self
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 32, height: 32)
                .foregroundStyle(DesignTokens.Colors.danger)   // Silme işlemi için uyarı rengi
                .padding(DesignTokens.Spacing.md)                   // Orta seviye padding
                .symbolRenderingMode(.multicolor)                    // Sistem sembolünde çok renkli görünüm
        }
    }

    // MARK: - Save Button Style
    // Kaydetme butonunun görünüm ve etkileşim stilini tanımlar.
    // DesignTokens'daki font, renk, radius, spacing ve gölge değerleri kullanılarak tüm uygulamada tutarlı buton görünümü sağlanır.
    struct SaveButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(DesignTokens.Typography.base.weight(.medium))          // Orta ağırlıkta base font
                .padding(.horizontal, DesignTokens.Spacing.lg)               // Yatay padding
                .padding(.vertical, DesignTokens.Spacing.md)                 // Dikey padding
                .frame(maxWidth: .infinity)                                   // Buton genişliğini maksimuma çıkar
                .background(DesignTokens.Colors.iconPrimary)                  // Ana renk arka plan
                .foregroundColor(.white)                                      // Yazı rengi beyaz
                .cornerRadius(DesignTokens.BorderRadius.md)                   // Orta boy border radius
                .shadow(color: DesignTokens.Shadows.sm, radius: 1, y: 1)     // Hafif gölge efekti
                .scaleEffect(configuration.isPressed ? 0.98 : 1.0)           // Basılıyken küçülme efekti
                .animation(.easeOut(duration: 0.1), value: configuration.isPressed) // Animasyon geçişi
        }
    }

    // MARK: - PhotoPickerButtonStyle
    // Fotoğraf seçici için özel buton stili.
    struct PhotoPickerButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(DesignTokens.Typography.base.weight(.medium))
                .foregroundStyle(DesignTokens.Colors.iconPrimary)
                .padding(.horizontal, DesignTokens.Spacing.lg)
                .padding(.vertical, DesignTokens.Spacing.md)
                .background(DesignTokens.Colors.surface)
                .cornerRadius(DesignTokens.BorderRadius.md)
                .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
        }
    }

    // MARK: - Cancel Button Style
    // İptal butonunun görünüm ve etkileşim stilini tanımlar.
    // DesignTokens üzerinden renk, font, spacing ve radius değerleri kullanılarak uygulamada tutarlı görünüm sağlar.
    struct CancelButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(DesignTokens.Typography.base.weight(.medium))
                .padding(DesignTokens.Spacing.md)
                .foregroundColor(DesignTokens.Colors.buttonCancelTint)
                .background(Color.clear)
                .cornerRadius(DesignTokens.BorderRadius.sm)
                .opacity(configuration.isPressed ? 0.7 : 1.0)
        }
    }
