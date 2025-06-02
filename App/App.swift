import SwiftUI

@main
struct StoicJournalApp: App {
    @StateObject private var schemeManager = ColorSchemeManager()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(schemeManager)
                .preferredColorScheme(schemeManager.currentColorScheme)
        }
    }
}
