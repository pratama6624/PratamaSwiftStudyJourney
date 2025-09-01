// Docs Sample
extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}

// Real Case
protocol Printable {
    func prettyPrint()
}

// Default to Collection of String
extension Collection where Element == String {
    func prettyPrint() {
        print("Joined: \(self.joined(separator: ", "))")
    }
}

// Default to Collection of Int
extension Collection where Element == Int {
    func prettyPrint() {
        print("Sum: \(self.reduce(0, +))")
    }
}

let names = ["Aldo", "Pratama", "Cici"]
names.prettyPrint()

let scores = [10, 20, 30, 40]
scores.prettyPrint()