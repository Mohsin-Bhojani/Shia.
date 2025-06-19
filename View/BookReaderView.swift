import SwiftUI

struct BookReaderView: View {
    let book: Book
    @State private var fontSize: CGFloat = 16

    var body: some View {
        VStack {
            ScrollView {
                Text(book.content)
                    .font(.system(size: fontSize))
                    .padding()
            }

            Divider()

            HStack {
                Text("Font Size")
                Slider(value: $fontSize, in: 12...28, step: 1)
                Text("\(Int(fontSize))")
            }
            .padding(.horizontal)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
