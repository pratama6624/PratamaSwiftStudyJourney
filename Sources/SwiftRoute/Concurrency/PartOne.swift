import Foundation

// Defining and Calling Asynchronous Functions
func fetchData() async -> String {
    print("Mulai fetch di background...")
    try? await Task.sleep(nanoseconds: 2_000_000_000)
    return "data berhasil diambil"
}
func main() {
    Task {
        print("Memulai task")
        let result = await fetchData()
        print(result)
        print("Selesai")
    }
}
main()
// RunLoop.main.run() // Agar CLI tidak berhenti dan mau menunggu

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
// Task {
//     for await number in InfiniteCounter(start: 15) {
//         print("Loop \(number)")
//     }
// }
// RunLoop.main.run() // Agar CLI Berhenti

// Calling Asynchronous Functions in Parallel
func downloadPhoto(named name: String) async -> String {
    print("Start Download \(name)")
    try? await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...3_000_000_000))
    print("Finish Download \(name)")
    return "Photo \(name)"
}
Task {
    async let p1 = downloadPhoto(named: "A")
    async let p2 = downloadPhoto(named: "B")
    async let p3 = downloadPhoto(named: "C")

    let photos = await [p1, p2, p3]
    print("All photos downloaded: \(photos)")
}
RunLoop.main.run()

// Tasks and Task Groups
