import Foundation

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