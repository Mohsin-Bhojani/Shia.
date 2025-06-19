import SwiftUI

struct BookCard: View {
    let book: Book

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(book.coverImage)
                .resizable()
                .scaledToFit()
                .frame(height: 180)
                .cornerRadius(12)

            Text(book.title)
                .font(.headline)
                .lineLimit(1)

            Text(book.author)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(width: 140)
    }
}
