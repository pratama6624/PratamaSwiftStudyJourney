// Sample Case
protocol TextRepresentable {
    var textualDescription: String { get }
}

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

// Default Implementation
extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

// Real Case
protocol Loggable {
    var message: String { get }
    func log()
}

// Default Implementation
extension Loggable {
    func log() {
        print("Log: \(message)")
    }
}

struct ErrorLog: Loggable {
    var message: String
}

struct InfoLog: Loggable {
    var message: String

    // Override default log
    func log() {
        print("INFO: \(message)")
    }
}

// MARK: ~ Test
let error = ErrorLog(message: "Something went wrong")
error.log()
let info = InfoLog(message: "App started")
info.log()