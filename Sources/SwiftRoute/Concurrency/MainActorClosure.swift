import Foundation

// @MainActor Closure
func downloadData() async -> String {
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    return "Data dari server"
}

@MainActor
func updateUI(with text: String) {
    print("Update UI: \(text)")
}

Task {
    let result = await downloadData()
    Task { @MainActor in
        updateUI(with: result)
    }
}

RunLoop.main.run(until: Date().addingTimeInterval(2))