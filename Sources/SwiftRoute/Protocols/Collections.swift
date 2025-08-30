protocol TextRepresentable {
    var textualDescription: String { get }
}

// MARK: - Models
struct Task: TextRepresentable {
    var title: String
    var deadline: String

    var textualDescription: String {
        "Task: \(title), deadline: \(deadline)"
    }
}

struct Event: TextRepresentable {
    var name: String
    var location: String
    
    var textualDescription: String {
        "Event: \(name) at \(location)"
    }
}

struct Reminder: TextRepresentable {
    var note: String
    
    var textualDescription: String {
        "Reminder: \(note)"
    }
}


let items: [TextRepresentable] = [
    Task(title: "Belajar Swift", deadline: "Besok"),
    Event(name: "Meetup iOS", location: "Jakarta"),
    Reminder(note: "Minum air putih")
]

// Iterable
for item in items {
    print(item.textualDescription)
    
}