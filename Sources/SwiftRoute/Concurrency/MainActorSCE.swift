import Foundation

@MainActor
// Struct untuk menampung array foto
struct PhotoGallery {
    var photoNames: [String] = []

    // Menampilkan isi array
    func drawUI() {
        print("Menampilkan UI dengan foto: \(photoNames)")
    }

    // Menambahkan isi array
    mutating func addPhoto(_ name: String) {
        photoNames.append(name)
        print("Foto \(name) ditambahkan")
    }
}

// Anggap saja load dari local storage / network / cloud
func loadPhotos() async -> [String] {
    try? await Task.sleep(nanoseconds: 500_000_000) // delay 0.5 detik
    return ["beach.png", "mountain.png", "city.png"]
}

// Simulasi flow
Task {
    let gallery = await PhotoGallery()
    let photos = await loadPhotos()

    // Karena struct menggunakan @MainActor maka kita harus pakai await untuk jalan di backgroud
    await gallery.drawUI()

    var mutableGallery = gallery
    for photo in photos {
        await mutableGallery.addPhoto(photo)
    }

    await mutableGallery.drawUI()
}

// Run ala CLI
RunLoop.main.run(until: Date().addingTimeInterval(2))