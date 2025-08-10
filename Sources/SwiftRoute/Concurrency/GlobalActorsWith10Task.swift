import Foundation

// Sepcial actor for logging
actor MyLoggerActor {
    func log(_ message: String) async {
        print("[\(Date())] \(message)")
        // 0.5 second work simulation
        try? await Task.sleep(nanoseconds: 500_000_000)
    }
}

// Global Actor
@globalActor
struct LoggerActor {
    static let shared = MyLoggerActor()
}

// Functions that are executed in the global actor
@LoggerActor
func writeLog(_ text: String) async {
    await LoggerActor.shared.log(text)
}

// Main Task
Task {
    await withTaskGroup(of: Void.self) { group in
        for i in 1...10 {
            group.addTask {
                await writeLog("Job \(i) is executed in thread \(Thread.current)")
            }
        }
    }
}