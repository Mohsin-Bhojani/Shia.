import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedMenu: String = "Home"
    @State private var isSidebarCollapsed: Bool = false

    var body: some View {
        GeometryReader { geometry in
            let isWide = geometry.size.width > 700
            let useCapsuleMenu = isSidebarCollapsed || !isWide

            ZStack(alignment: .bottom) {
                HStack(spacing: 0) {
                    // Sidebar (visible only if not collapsed and wide)
                    if isWide && !isSidebarCollapsed {
                        VStack(spacing: 24) {
                            HStack {
                                Text("Shia.")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                                Button(action: {
                                    withAnimation {
                                        isSidebarCollapsed.toggle()
                                    }
                                }) {
                                    Image(systemName: "chevron.left")
                                        .font(.title3)
                                }
                            }
                            .padding(.top)
                            
                            ForEach(menuItems, id: \.title) { item in
                                SidebarButton(
                                    title: item.title,
                                    systemImage: item.icon,
                                    isSelected: selectedMenu == item.title
                                ) {
                                    selectedMenu = item.title
                                }
                            }

                            Spacer()
                        }
                        .padding()
                        .frame(width: 240)
                        .background(Color(.systemGray6))
                    }

                    Divider()

                    // Main Content
                    ScrollView {
                        Group {
                            switch selectedMenu {
                            case "Home":
                                HomeContentView()
                            case "Insights":
                                Text("Insights View Placeholder")
                            case "Journal":
                                Text("Journal View Placeholder")
                            case "Settings":
                                SettingsView()
                            default:
                                HomeContentView()
                            }
                        }
                        .frame(maxWidth: min(geometry.size.width * 0.9, 600))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                    }
                    .background(ColorSchemeManager.primary(colorScheme).ignoresSafeArea())
                }

                // Floating Capsule Menu
                if useCapsuleMenu {
                    CapsuleMenu(
                        selectedMenu: $selectedMenu,
                        menuItems: menuItems,
                        toggleSidebar: {
                            withAnimation {
                                isSidebarCollapsed.toggle()
                            }
                        }
                    )
                    .padding(.bottom, 20)
                }
            }
        }
    }

    var menuItems: [MenuItem] = [
        .init(title: "Home", icon: "house"),
        .init(title: "Insights", icon: "chart.bar"),
        .init(title: "Journal", icon: "book.closed"),
        .init(title: "Settings", icon: "gear")
    ]
}

struct MenuItem {
    var title: String
    var icon: String
}

// MARK: - Sidebar Button

struct SidebarButton: View {
    var title: String
    var systemImage: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: systemImage)
                Text(title)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .foregroundColor(isSelected ? .accentColor : .primary)
            .background(isSelected ? Color.accentColor.opacity(0.15) : .clear)
            .cornerRadius(12)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct HomeContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Welcome to Shia.")
                .font(.system(size: 34, weight: .bold))
                .foregroundColor(ColorSchemeManager.textPrimary(colorScheme))

            Text("Your daily thoughts, reflections, and growth.")
                .font(.subheadline)
                .foregroundColor(ColorSchemeManager.textSecondary(colorScheme))

            RoundedRectangle(cornerRadius: 20)
                .fill(ColorSchemeManager.secondary(colorScheme))
                .frame(height: 180)
                .overlay(
                    Text("Start your reflection...")
                        .foregroundColor(ColorSchemeManager.textPrimary(colorScheme))
                        .font(.headline)
                )

            Spacer()
        }
    }
}


// MARK: - CapsuleMenu View

struct CapsuleMenu: View {
    @Binding var selectedMenu: String
    var menuItems: [MenuItem]
    var toggleSidebar: () -> Void

    var body: some View {
        HStack(spacing: 32) {
            ForEach(menuItems, id: \.title) { item in
                VStack(spacing: 4) {
                    Image(systemName: item.icon)
                        .font(.system(size: 18))
                    Text(item.title)
                        .font(.caption2)
                }
                .foregroundColor(selectedMenu == item.title ? .accentColor : .primary)
                .padding(8)
                .onTapGesture {
                    selectedMenu = item.title
                }
            }

            Divider().frame(height: 24)

            // Collapse/Expand Toggle Button
            Button(action: toggleSidebar) {
                Image(systemName: "sidebar.left")
                    .font(.system(size: 18))
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .shadow(radius: 6)
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
