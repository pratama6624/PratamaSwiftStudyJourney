import Foundation

/*
    KODE DIBAWAH INI HARUSNYA ERROR
    KARENA TIDAK ADA PROTEKSI DARI DATA RACE
    ATAU GA PAKAI SENDABLE
*/

// Unsafe mutable classes are shared between tasks
class UnsafeCounter {
    var value: Int = 0
    func increment() {
        value += 1
    }
}

func doWork(counter: UnsafeCounter) async {
    counter.increment()
    print("Counter: \(counter.value)")
}

Task {
    let counter = UnsafeCounter()

    await withTaskGroup(of: Void.self) { group in
        for _ in 1...3 {
            group.addTask {
                await doWork(counter: counter)
            }
        }
    }
}