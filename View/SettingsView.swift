import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var notificationsEnabled = true
    @State private var appLockEnabled = false
    @State private var themeSelection = "System"

    let themes = ["Light", "Dark", "System"]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // Profile Banner
                HStack(spacing: 16) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.accentColor)

                    VStack(alignment: .leading) {
                        Text("Your Name")
                            .font(.headline)
                        Text("Edit Profile")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.top)

                // General Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("GENERAL")
                        .font(.caption)
                        .foregroundColor(.gray)

                    Picker("App Theme", selection: $themeSelection) {
                        ForEach(themes, id: \.self) { theme in
                            Text(theme)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    Toggle("App Lock", isOn: $appLockEnabled)
                }

                // About Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("ABOUT")
                        .font(.caption)
                        .foregroundColor(.gray)

                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0").foregroundColor(.gray)
                    }

                    HStack {
                        Text("Developer")
                        Spacer()
                        Text("Team Shia").foregroundColor(.gray)
                    }
                }

                Spacer()
            }
            .padding()
            .frame(maxWidth: 600)
            .background(ColorSchemeManager.primary(colorScheme))
            .foregroundColor(ColorSchemeManager.textPrimary(colorScheme))
        }
        .navigationTitle("Settings")
        .background(ColorSchemeManager.primary(colorScheme))
    }
}
