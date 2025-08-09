import Foundation

struct PhotoGallery {
    @MainActor var photoNames: [String] = []
    var hasCachedPhotos = false

    @MainActor
    func drawUI() {
        print("Menampilakn UI dengan foto: \(photoNames)")
    }

    func cachePhotos() {
        print("Download & simpan foto ke cache...")
    }
}

func loadPhotosFromServer() async -> [String] {
    try? await Task.sleep(nanoseconds: 300_000_000)
    return ["forest.jpg", "river.jpg"]
}

Task {
    var gallery = PhotoGallery()

    // Background work tanpa main actor
    let downloadedPhotos = await loadPhotosFromServer()
    gallery.hasCachedPhotos = true
    gallery.cachePhotos()

    // Update UI -> Harus pakai await karena drawUI adalah @MainActor
    await gallery.drawUI()

    // Update property @MainActor
    await MainActor.run {
        gallery.photoNames.append(contentsOf: downloadedPhotos)
    }

    await gallery.drawUI()
}

RunLoop.main.run(until: Date().addingTimeInterval(1))