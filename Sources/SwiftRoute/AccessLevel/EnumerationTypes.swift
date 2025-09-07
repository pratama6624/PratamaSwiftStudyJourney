// Saple Basic
public enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Status {
    case success
    case failure
}

public enum Response {
    case ok
    private case failed // Error -> Gaboleh beda
}