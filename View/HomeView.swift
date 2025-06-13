import SwiftUI

enum MenuOption: String, CaseIterable {
    case shia = "Shia."
    case today = "Today"
    case library = "Library"
    case trends = "Trends"
    case search = "Search"
}

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isSidebarExpanded: Bool = true
    @State private var selectedView: MenuOption = .shia
    @State private var showProfile: Bool = false

    var body: some View {
        HStack(spacing: 0) {
            if isSidebarExpanded {
                sidebarView
                    .transition(.move(edge: .leading))
            }

            ZStack {
                mainContent
                if showProfile {
                    ProfileView()
                        .transition(.move(edge: .trailing))
                        .zIndex(1)
                }
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isSidebarExpanded)
        .background(ColorSchemeManager.primary(colorScheme).ignoresSafeArea())
    }

    var sidebarView: some View {
        VStack(spacing: 12) {
            Spacer()

            ForEach(MenuOption.allCases, id: \.self) { option in
                Button(action: {
                    selectedView = option
                }) {
                    VStack(spacing: 4) {
                        Image(systemName: iconName(for: option))
                            .font(.title2)
                        Text(option.rawValue)
                            .font(.caption2)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 6)
                    .foregroundColor(
                        selectedView == option
                        ? ColorSchemeManager.buttonPrimary(colorScheme)
                        : ColorSchemeManager.menuInactive(colorScheme) // NEW helper
                    )
                }
            }

            Spacer()

            Button(action: {
                withAnimation {
                    isSidebarExpanded.toggle()
                }
            }) {
                Image(systemName: "chevron.left")
                    .rotationEffect(.degrees(isSidebarExpanded ? 0 : 180))
                    .padding()
                    .foregroundColor(ColorSchemeManager.accent(colorScheme))
            }

            Button(action: {
                // New entry logic
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 28))
                    .foregroundColor(ColorSchemeManager.buttonPrimary(colorScheme))
                    .padding(.bottom, 30)
            }
        }
        .frame(width: 80)
        .background(ColorSchemeManager.secondary(colorScheme))
    }

    var mainContent: some View {
        VStack {
            HStack {
                if !isSidebarExpanded {
                    Button(action: {
                        withAnimation {
                            isSidebarExpanded.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title2)
                            .foregroundColor(ColorSchemeManager.accent(colorScheme))
                            .padding(.leading)
                    }
                }

                Spacer()

                // Profile Button Top Right
                Button(action: {
                    withAnimation {
                        showProfile.toggle()
                    }
                }) {
                    Image(systemName: "person.crop.circle")
                        .font(.title2)
                        .foregroundColor(ColorSchemeManager.accent(colorScheme))
                        .padding()
                }
            }

            Spacer()

            // Render selected content
            Group {
                switch selectedView {
                case .shia:
                    Text("Welcome to Shia.")
                case .today:
                    Text("Today's Notes")
                case .library:
                    Text("Library Content")
                case .trends:
                    Text("Trends & Insights")
                case .search:
                    Text("Search View")
                }
            }
            .font(.title)
            .foregroundColor(ColorSchemeManager.accent(colorScheme))

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    func iconName(for option: MenuOption) -> String {
        switch option {
        case .shia: return "house.fill"
        case .today: return "calendar"
        case .library: return "books.vertical"
        case .trends: return "chart.bar.fill"
        case .search: return "magnifyingglass"
        }
    }
}

struct ProfileView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Profile")
                    .font(.title)
                    .padding()
                Spacer()
            }
            Spacer()
            Text("User Profile Information")
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground).ignoresSafeArea())
    }
}
