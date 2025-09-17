import Foundation

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

struct Photo {
    let name: String
}

struct PhotoAlbum: Container {
    private var photos: [Photo] = []

    mutating func append(_ item: Photo) {
        photos.append(item)
    }

    var count: Int { photos.count }

    subscript(i: Int) -> Photo {
        photos[i]
    }
}

extension PhotoAlbum: SuffixableContainer {
    func suffix(_ size: Int) -> PhotoAlbum {
        var result = PhotoAlbum()
        for index in (count - size)..<count {
            result.append(self[index])
        }
        return result
    }
    // Swift otomatis infer Suffix = PhotoAlbum
}

var album = PhotoAlbum()
album.append(Photo(name: "Holiday1"))
album.append(Photo(name: "Holiday2"))
album.append(Photo(name: "Holiday3"))
let lastTwo = album.suffix(2) // lastTwo: PhotoAlbum
print(lastTwo.count) // 2