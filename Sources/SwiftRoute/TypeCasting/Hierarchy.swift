// Base Class
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

// Subclasses
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

// Array & Mixed type -> library
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// Type of library inferred as [MediaItem]

// Iteration
for item in library {
    if let movie = item as? Movie {
        print("🎬 Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("🎵 Song: \(song.name), by \(song.artist)")
    }
}