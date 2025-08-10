import Foundation

// Custom actor singleton
actor MyLoggerActor {
    func log(_ message: String) {
        print("[LOG]: \(message)")
    }
}

// This is global actor
@globalActor
struct LoggerActor {
    static let shared = MyLoggerActor()
}

// Use in function
@LoggerActor
func writeLog(_ text: String) {
    print("Menulis log: \(text)")
}

Task {
    await writeLog("Hello world")
}