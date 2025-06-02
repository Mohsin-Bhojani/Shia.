import SwiftUI

class ColorSchemeManager: ObservableObject {
    @AppStorage("selectedColorScheme") var selectedScheme: String = "system" {
        didSet { objectWillChange.send() }
    }
    
    var currentColorScheme: ColorScheme? {
        switch selectedScheme {
        case "light": return .light
        case "dark": return .dark
        default: return nil
        }
    }
}

