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

    static func button(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? Color("ButtonDark") : Color("ButtonLight")
    }

    static func textPrimary(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? Color.white : Color.black
    }

    static func textSecondary(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? Color.gray : Color.gray.opacity(0.7)
    }
}
