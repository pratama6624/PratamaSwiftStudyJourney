import Foundation

internal protocol InternalProtocol {
    func doSomething()
}

// Error
// public protocol PublicProtocol: InternalProtocol {
//     func doMore()
// }

// Success
internal protocol AnotherProtocol: InternalProtocol {
    func doMore()
}