import Foundation

// Task Detached
func runDetachedTask() {
    let task = Task.detached {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        print("Ini jalan di detached task")
        return 42
    }

    Task {
        let value = await task.value
        print("Value dari detached task: \(value)")

    }
}

runDetachedTask()
RunLoop.main.run()