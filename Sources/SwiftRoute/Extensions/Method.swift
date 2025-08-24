import Foundation

extension Int {
    func remind(message: String) {
        for i in 1...self {
            print("🔔 Reminder \(i): \(message)")
        }
    }
}

5.remind(message: "Don't forget to drink water")