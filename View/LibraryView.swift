import SwiftUI

struct LibraryView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var searchText = ""
    @State private var books: [Book] = Book.sampleData

    var filteredBooks: [Book] {
        searchText.isEmpty ? books : books.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.author.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 16)], spacing: 20) {
                    ForEach(filteredBooks) { book in
                        NavigationLink(destination: BookReaderView(book: book)) {
                            BookCard(book: book)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Library")
            .searchable(text: $searchText)
            .background(ColorSchemeManager.primary(colorScheme))
        }
    }
}
