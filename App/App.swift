import SwiftUI

@main
struct ShiaApp: App {

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

func colorSchemeFrom(_ theme: String) -> ColorScheme? {
    switch theme {
    case ThemeMode.light.rawValue:
        return .light
    case ThemeMode.dark.rawValue:
        return .dark
    default:
        return nil
    }
}
