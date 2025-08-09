import Foundation

// Task Cancellation
func doSomething() async {
    print("(Task mulai)")

    for i in 1...5 {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        if Task.isCancelled {
            print("task dibatalkan di iterasi \(i)")
            return
        }
        print("Iterasi ke \(i)")
    }
    print("Task selesai tanpa dibatalkan")
}

func runTaskWithCancel() {
    let task = Task {
        await doSomething()
    }

    Task {
        try? await Task.sleep(1_900_000_000)
        task.cancel()
        print("Task dibatalkan secara manual")
    }
}

runTaskWithCancel()
RunLoop.main.run()