import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var notificationsEnabled = true
    @State private var appLockEnabled = false
    @State private var themeSelection = "System"

    let themes = ["Light", "Dark", "System"]

    var body: some View {
        NavigationView {
            List {
                // Profile Banner
                Section {
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
                    .padding(.vertical, 8)
                }

                // General Section
                Section(header: Text("GENERAL")) {
                    Picker("App Theme", selection: $themeSelection) {
                        ForEach(themes, id: \.self) { theme in
                            Text(theme)
                        }
                    }

                    Toggle("Enable Notifications", isOn: $notificationsEnabled)

                    Toggle("App Lock", isOn: $appLockEnabled)
                }

                // About
                Section(header: Text("ABOUT")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.gray)
                    }

                    HStack {
                        Text("Developer")
                        Spacer()
                        Text("Team Shia")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Settings")
            .listStyle(InsetGroupedListStyle())
            .background(ColorSchemeManager.primary(colorScheme))
        }
    }
}
