import Foundation

public struct UserProfile {
    public var username: String = ""
    public var bin: String = ""

    // No init

    // Solution
    public init() {}
}

// let profile = UserProfile() // Error
let profile = UserProfile() // Success