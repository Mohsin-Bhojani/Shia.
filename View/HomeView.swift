import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Welcome to Shia.")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(ColorSchemeManager.textPrimary(colorScheme))

            Text("Your daily thoughts, reflections, and growth.")
                .foregroundColor(ColorSchemeManager.textSecondary(colorScheme))

            Spacer()
        }
        .padding()
        .background(ColorSchemeManager.primary(colorScheme).ignoresSafeArea())
    }
}
