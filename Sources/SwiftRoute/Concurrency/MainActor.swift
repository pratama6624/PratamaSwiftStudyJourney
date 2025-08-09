import Foundation

// The Main Actor
@MainActor
func show(_ data: Data) {
    print("Tampilkan foto ke layar")
    CFRunLoopStop(CFRunLoopGetMain())
}

let sampleData = "images_1"
if let sample = sampleData.data(using: .utf8) {
    Task {
        await show(sample)
    }
}
CFRunLoopRun()