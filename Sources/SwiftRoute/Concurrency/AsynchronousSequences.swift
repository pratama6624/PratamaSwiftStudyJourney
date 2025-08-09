import Foundation

// Asynchronous Sequences
let handle = FileHandle.standardInput

// for try await line in handle.bytes.lines{
//     print("Kamu ngetik: \(line)")
// }

// Custom Countdown
struct InfiniteCounter: AsyncSequence {
    typealias Element = Int

    let start: Int

    struct AsyncIterator: AsyncIteratorProtocol {
        var current: Int

        mutating func next() async -> Int? {
            guard current >= 0 else { return nil }
            await Task.sleep(1_000_000_000) // 1 detik
            defer { current -= 1 }
            return current
        }
    }

    func makeAsyncIterator() -> AsyncIterator {
        return AsyncIterator(current: start)
    }
}
Task {
    for await number in InfiniteCounter(start: 15) {
        print("Loop \(number)")
    }
}
RunLoop.main.run() // Agar CLI Berhenti