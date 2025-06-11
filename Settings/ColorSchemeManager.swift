import SwiftUI

struct ColorSchemeManager {
    
    static func primary(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? Color("PrimaryDark") : Color("PrimaryLight")
    }
    
    static func secondary(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? Color("SecondaryDark") : Color("SecondaryLight")
    }

    static func accent(_ scheme: ColorScheme) -> Color {
        Color("Accent") // Same in both modes
    }

    static func buttonPrimary(_ scheme: ColorScheme) -> Color {
        Color("ButtonPrimary") // Same in both modes
    }

    static func buttonSecondary(_ scheme: ColorScheme) -> Color {
        Color("ButtonSecondary") // Same in both modes
    }

    static func error(_ scheme: ColorScheme) -> Color {
        Color("Error") // Same in both modes
    }

    static func success(_ scheme: ColorScheme) -> Color {
        Color("Success") // Same in both modes
    }
}

