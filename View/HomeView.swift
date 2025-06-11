import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Sidebar()
            Dashboard()
        }
    }
}

// MARK: - Sidebar

struct Sidebar: View {
    var body: some View {
        List {
            Section {
                Label("Today", systemImage: "calendar")
                Label("Inspirations", systemImage: "lightbulb")
                Label("Library", systemImage: "books.vertical")
                Label("Journey", systemImage: "square.and.pencil")
                Label("Trends", systemImage: "chart.line.uptrend.xyaxis")
                Label("Search", systemImage: "magnifyingglass")
            }

            Section(header: Text("Favorites")) {
                Label("Add New", systemImage: "plus.circle")
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("stoic.")
    }
}

// MARK: - Dashboard

struct Dashboard: View {
    @Environment(\.colorScheme) var colorScheme

    var background: Color {
        colorScheme == .dark ? Color.black : Color(.systemGray6)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                TopBar()
                CalendarBar()

                HStack(spacing: 16) {
                    JournalCard(title: "New day, fresh start!", subtitle: "Morning Preparation")
                    JournalCard(title: "Reflect before sleep.", subtitle: "Evening Reflection")
                }
                .padding(.horizontal)

                BackupReminder()
                ReflectionCard()
                QuoteView()

                Spacer()
            }
            .padding(.top)
        }
        .background(background.ignoresSafeArea())
    }
}

// MARK: - Top Bar

struct TopBar: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack {
            Text("Good evening.")
                .font(.title2.bold())
                .foregroundColor(.primary)
            Spacer()
            Image(systemName: "person.circle")
                .font(.title)
                .foregroundColor(.primary)
        }
        .padding(.horizontal)
    }
}

// MARK: - Calendar Bar

struct CalendarBar: View {
    let days = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
    var body: some View {
        HStack(spacing: 15) {
            ForEach(0..<7) { index in
                VStack {
                    Text(days[index])
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("\(25 + index)")
                        .foregroundColor(index == 1 ? .black : .white)
                        .padding(8)
                        .background(index == 1 ? Color.white : Color.clear)
                        .clipShape(Circle())
                }
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Journal Card

struct JournalCard: View {
    var title: String
    var subtitle: String
    @Environment(\.colorScheme) var colorScheme

    var cardColor: Color {
        colorScheme == .dark ? Color(.darkGray) : Color.white
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.gray)
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
            Button("Begin") {}
                .buttonStyle(.borderedProminent)
                .tint(.blue)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 140)
        .background(cardColor)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Backup Reminder

struct BackupReminder: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "icloud.slash")
                .font(.largeTitle)
                .foregroundColor(.blue)
            Text("Your journals have not been backed up for 218 days")
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
            Button("Turn on automatic backup") {}
                .buttonStyle(.borderedProminent)
            Button("Manually export and backup", role: .cancel) {}
                .font(.footnote)
        }
        .padding()
        .background(Color(.systemGray5))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

// MARK: - Reflection Card

struct ReflectionCard: View {
    @Environment(\.colorScheme) var colorScheme

    var cardColor: Color {
        colorScheme == .dark ? Color(.darkGray) : Color.white
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("on the child within.")
                .font(.headline)
                .foregroundColor(.primary)
            Text("Day 2 of 7")
                .font(.caption)
                .foregroundColor(.gray)
            Button("Reflect") {}
                .buttonStyle(.bordered)
                .foregroundColor(.blue)
        }
        .padding()
        .background(cardColor)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

// MARK: - Quote View

struct QuoteView: View {
    var body: some View {
        VStack(spacing: 6) {
            Text("“No work is insignificant. All labor that uplifts humanity has dignity and importance and should be undertaken with painstaking excellence.”")
                .italic()
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            Text("— Martin Luther King Jr.")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

// MARK: - Preview

#Preview {
    HomeView()
}

