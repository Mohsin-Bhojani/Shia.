import SwiftUI

struct ColorSchemeManager {
    static func primary(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? Color("PrimaryDark") : Color("PrimaryLight")
    }

    static func secondary(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? Color("SecondaryDark") : Color("SecondaryLight")
    }

    static func accent(_ scheme: ColorScheme) -> Color {
        Color("Accent")
    }

    static func buttonPrimary(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? .white : .blue
    }

    static func menuInactive(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? Color.white.opacity(0.6) : Color.black.opacity(0.6)
    }
}
