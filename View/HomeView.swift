import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isSidebarExpanded: Bool = true

    var body: some View {
        HStack(spacing: 0) {
            if isSidebarExpanded {
                sidebarView
                    .transition(.move(edge: .leading))
            }

            mainContent
        }
        .animation(.easeInOut(duration: 0.3), value: isSidebarExpanded)
        .background(ColorSchemeManager.primary(colorScheme).ignoresSafeArea())
    }

    var sidebarView: some View {
        VStack {
            // Top Profile Button
            Button(action: {
                // Profile action
            }) {
                Image(systemName: "person.crop.circle")
                    .font(.title)
                    .foregroundColor(ColorSchemeManager.accent(colorScheme))
                    .padding()
            }

            Spacer()

            // Collapse Button
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

            // New Entry Button
            Button(action: {
                // New entry action
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 28))
                    .foregroundColor(ColorSchemeManager.buttonPrimary(colorScheme))
                    .padding()
            }
            .padding(.bottom, 30)
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
                            .padding()
                    }
                }

                Spacer()
            }

            Spacer()

            Text("Welcome to Journal App")
                .font(.title)
                .foregroundColor(ColorSchemeManager.accent(colorScheme))

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

