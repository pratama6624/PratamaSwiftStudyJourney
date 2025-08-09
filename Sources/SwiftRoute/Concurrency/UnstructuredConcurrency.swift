import Foundation

// Unstructured Concurrency
// Task
func printDelayedMessage() async {
    print("Mulai ngerjain sesuatu di task...")
    try? await Task.sleep(nanoseconds: 2_000_000_000)
    print("Selesai task setelah delay")
}

func runUnstructuredTask() {
    let task = Task {
        await printDelayedMessage()
        return "Hasil dari task"
    }

    Task {
        let result = await task.value
        print("Task return: \(result)")
    }
}

runUnstructuredTask()
RunLoop.main.run()