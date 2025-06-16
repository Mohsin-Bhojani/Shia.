import SwiftUI

struct SidebarView: View {
    var body: some View {
        List {
            Label("Home", systemImage: "house")
            Label("Insights", systemImage: "chart.bar")
            Label("Journal", systemImage: "book.closed")
            Label("Settings", systemImage: "gear")
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Shia.")
    }
}

