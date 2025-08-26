protocol MusicPlayerDelegate: AnyObject {
    func playerDidStartPlaying(_ player: MusicPlayer, song: String)
    func playerDidPause(_ player: MusicPlayer)
    func playerDidFinishSong(_ player: MusicPlayer, song: String)
}

class MusicPlayer {
    weak var delegate: MusicPlayerDelegate?
    private var currentSong: String?

    func play(song: String) {
        currentSong = song
        print("🎵 Now playing: \(song)")
        delegate?.playerDidStartPlaying(self, song: song)
    }

    func pause() {
        guard let song = currentSong else { return }
        print("Paused: \(song)")
        delegate?.playerDidPause(self)
    }

    func stop() {
        guard let song = currentSong else { return }
        print("Finished: \(song)")
        delegate?.playerDidFinishSong(self, song: song)
        currentSong = nil
    }
}

class MusicLogger: MusicPlayerDelegate {
    func playerDidStartPlaying(_ player: MusicPlayer, song: String) {
        print("LOG: Started playing \(song)")
    }

    func playerDidPause(_ player: MusicPlayer) {
        print("LOG: Music paused")
    }

    func playerDidFinishSong(_ player: MusicPlayer, song: String) {
        print("LOG: Finished playing \(song)")
    }
}

let player = MusicPlayer()
let logger = MusicLogger()

player.delegate = logger

player.play(song: "Last Hope - Paramore")
player.pause()
player.stop()