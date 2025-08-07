import Foundation

// // Defining and Calling Asynchronous Functions
// func fetchData() async -> String {
//     print("Mulai fetch di background...")
//     try? await Task.sleep(nanoseconds: 2_000_000_000)
//     return "data berhasil diambil"
// }
// func main() {
//     Task {
//         print("Memulai task")
//         let result = await fetchData()
//         print(result)
//         print("Selesai")
//     }
// }
// main()
// // RunLoop.main.run() // Agar CLI tidak berhenti dan mau menunggu

// print("----------------------------------------------------------")

// // Asynchronous Sequences
// let handle = FileHandle.standardInput

// // for try await line in handle.bytes.lines{
// //     print("Kamu ngetik: \(line)")   
// // }

// // Custom Countdown
// struct InfiniteCounter: AsyncSequence {
//     typealias Element = Int

//     let start: Int

//     struct AsyncIterator: AsyncIteratorProtocol {
//         var current: Int

//         mutating func next() async -> Int? {
//             guard current >= 0 else { return nil }
//             await Task.sleep(1_000_000_000) // 1 detik
//             defer { current -= 1 }
//             return current
//         }
//     }

//     func makeAsyncIterator() -> AsyncIterator {
//         return AsyncIterator(current: start)
//     }
// }
// // Task {
// //     for await number in InfiniteCounter(start: 15) {
// //         print("Loop \(number)")
// //     }
// // }
// // RunLoop.main.run() // Agar CLI Berhenti

// print("----------------------------------------------------------")

// // Calling Asynchronous Functions in Parallel
// func downloadPhoto(named name: String) async -> String {
//     print("Start Download \(name)")
//     try? await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...3_000_000_000))
//     print("Finish Download \(name)")
//     return "Photo \(name)"
// }
// Task {
//     async let p1 = downloadPhoto(named: "A")
//     async let p2 = downloadPhoto(named: "B")
//     async let p3 = downloadPhoto(named: "C")

//     let photos = await [p1, p2, p3]
//     print("All photos downloaded: \(photos)")
// }
// // RunLoop.main.run()

// print("----------------------------------------------------------")

// // Tasks and Task Groups
// // Task Groups
// func downloadPhotoX(named name: String) async -> Data {
//     print("Start downloading \(name)")
//     try? await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...3_000_000_000))
//     print("Finished downloading \(name)")
//     return Data(name.utf8)    
// }

// func listPhotos(inGallery gallery: String) async -> [String] {
//     return ["Photo1", "Photo2", "Photo3", "Photo4"]
// }

// Task {
//     let photos = await withTaskGroup(of: Data.self) { group in
//         let names = await listPhotos(inGallery: "Test")

//         for name in names {
//             group.addTask {
//                 return await downloadPhotoX(named: name)
//             }
//         }

//         var result: [Data] = []
//         for await photo in group {
//             result.append(photo)
//         }

//         return result
//     }
// }
// RunLoop.main.run()

// print("----------------------------------------------------------")

// // Task Cancellation
// func doSomething() async {
//     print("(Task mulai)")
    
//     for i in 1...5 {
//         try? await Task.sleep(nanoseconds: 1_000_000_000)
//         if Task.isCancelled {
//             print("task dibatalkan di iterasi \(i)")
//             return
//         }
//         print("Iterasi ke \(i)")
//     }
//     print("Task selesai tanpa dibatalkan")
// }

// func runTaskWithCancel() {
//     let task = Task {
//         await doSomething()
//     }

//     Task {
//         try? await Task.sleep(1_900_000_000)
//         task.cancel()
//         print("Task dibatalkan secara manual")
//     }
// }

// runTaskWithCancel()
// RunLoop.main.run()

// print("----------------------------------------------------------")

// // Unstructured Concurrency
// // Task
// func printDelayedMessage() async {
//     print("Mulai ngerjain sesuatu di task...")
//     try? await Task.sleep(nanoseconds: 2_000_000_000)
//     print("Selesai task setelah delay")    
// }

// func runUnstructuredTask() {
//     let task = Task {
//         await printDelayedMessage()
//         return "Hasil dari task"
//     }

//     Task {
//         let result = await task.value
//         print("Task return: \(result)")
//     }
// }

// runUnstructuredTask()
// RunLoop.main.run()

// // Task Detached
// func runDetachedTask() {
//     let task = Task.detached {
//         try? await Task.sleep(nanoseconds: 1_000_000_000)
//         print("Ini jalan di detached task")
//         return 42
//     }

//     Task {
//         let value = await task.value
//         print("Value dari detached task: \(value)")
        
//     }
// }

// runDetachedTask()
// RunLoop.main.run()

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
// Actors
actor BankAccount {
    var balance = 0

    func deposit(_ amount: Int) {
        balance += amount
    }

    func getBalance() -> Int {
        return balance
    }
}

let account = BankAccount()

Task {
    await account.deposit(1000)
    print(await account.getBalance()) // Safe from data race condition
}

// The Main Actor


