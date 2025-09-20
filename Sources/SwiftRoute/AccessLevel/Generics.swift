import Foundation

internal protocol InternalProtocol {
    func doSomething()
}

public struct MyStruct: InternalProtocol {
    public func doSomething() {
        print("Doing something")
    }
}

// Error
public func processItem<T: InternalProtocol>(_ item: T) {
    item.doSomething()
}