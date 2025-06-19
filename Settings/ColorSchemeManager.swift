import SwiftUI

struct ColorSchemeManager {
    static func primary(_ scheme: ColorScheme) -> Color {
        Color("Primary")
    }

    static func secondary(_ scheme: ColorScheme) -> Color {
        Color("Secondary")
    }

    static func accent(_ scheme: ColorScheme) -> Color {
        Color("AccentColor")
    }

    static func button(_ scheme: ColorScheme) -> Color {
        Color("ButtonPrimary")
    }

    static func textPrimary(_ scheme: ColorScheme) -> Color {
        Color.primary // dynamic system color
    }

    static func textSecondary(_ scheme: ColorScheme) -> Color {
        Color.secondary // dynamic system color
    }

    static func success(_ scheme: ColorScheme) -> Color {
        Color("Success")
    }

    static func error(_ scheme: ColorScheme) -> Color {
        Color("Error")
    }
}

enum ThemeMode: String, CaseIterable {
    case light, dark, system
}
