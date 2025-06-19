import Foundation

struct Book: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let coverImageName: String
    let content: String

    static let sampleBooks: [Book] = [
        Book(
            title: "The Mind Garden",
            author: "Zia Khan",
            coverImageName: "book1",
            content: "This is the full content of The Mind Garden.\n\nOnce upon a mindful time..."
        ),
        Book(
            title: "Reflections",
            author: "Ayla Noor",
            coverImageName: "book2",
            content: "This is the full content of Reflections.\n\nA peaceful thought a day keeps chaos away."
        ),
        Book(
            title: "Daily Stoic",
            author: "Marcus Echo",
            coverImageName: "book3",
            content: "This is the full content of Daily Stoic.\n\nYou are disturbed not by things, but by your interpretation."
        )
    ]
}
