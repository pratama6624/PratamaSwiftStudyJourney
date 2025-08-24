import Foundation

extension Date {
    func toReadableFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}

let now = Date()
print(now.toReadableFormat())