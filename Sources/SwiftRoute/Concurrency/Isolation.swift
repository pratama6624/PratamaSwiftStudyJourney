import Foundation

// Isolation
// Adalah cara untuk mencegah race condition
// Immutable Data
let name = "Pratama"
// Task-local Data
func process() async {
    var counter = 0

    await Task {
        counter += 5
    }.value

    print("counter is \(counter)")

}
// try await process()