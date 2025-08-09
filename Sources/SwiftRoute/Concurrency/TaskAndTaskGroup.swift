import Foundation

// Tasks and Task Groups
// Task Groups
func downloadPhotoX(named name: String) async -> Data {
    print("Start downloading \(name)")
    try? await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...3_000_000_000))
    print("Finished downloading \(name)")
    return Data(name.utf8)
}

func listPhotos(inGallery gallery: String) async -> [String] {
    return ["Photo1", "Photo2", "Photo3", "Photo4"]
}

Task {
    let photos = await withTaskGroup(of: Data.self) { group in
        let names = await listPhotos(inGallery: "Test")

        for name in names {
            group.addTask {
                return await downloadPhotoX(named: name)
            }
        }

        var result: [Data] = []
        for await photo in group {
            result.append(photo)
        }

        return result
    }
}
RunLoop.main.run()
