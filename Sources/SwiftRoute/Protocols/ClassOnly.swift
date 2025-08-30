// Class-only protocol
protocol Resettable: AnyObject {
    func reset()
}

// Use on class -> √
class GameManager: Resettable {
    var score = 0

    func reset() {
        score = 0
        print("Game reset. Score = \(score)")
    }
}

let game = GameManager()
game.score = 100
game.reset()
print(game.score)

// Gagal kalo dipake di struct ❌
/*
struct Player: Resettable {
    var score = 0
    
    func reset() { // Error: 'Resettable' can only be used as a constraint for class types
        score = 0
    }
}
*/

protocol DownloadDelegate: AnyObject {
    func downloadDidStart()
    func downloadDidFinish()
}

class Downloader {
    weak var delegate: DownloadDelegate?

    func startDownload() {
        delegate?.downloadDidStart()
        // ... downloading
        delegate?.downloadDidFinish()
    }
}

class ViewController: DownloadDelegate {
    func downloadDidStart() {
        print("Download started...")
    }
    
    func downloadDidFinish() {
        print("Download finished √")
    }
}