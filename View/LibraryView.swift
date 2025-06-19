import SwiftUI

struct LibraryView: View {
    @State private var searchText: String = ""
    private var books: [Book] = Book.sampleBooks

    var filteredBooks: [Book] {
        if searchText.isEmpty {
            return books
        } else {
            return books.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.author.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 16)], spacing: 20) {
                ForEach(filteredBooks) { book in
                    NavigationLink(destination: BookReaderView(book: book)) {
                        BookCard(book: book)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
        .searchable(text: $searchText)
    }
}
