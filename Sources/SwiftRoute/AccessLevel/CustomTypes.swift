// Case 1
public class SomePublicClass {
    public var somePublicProperty = 0 // Bisa diakses diluar module
    var someInternalProperty = 0       // default internal (gak bisa keluar module)
    fileprivate func someFilePrivateMethod() {} // hanya di file ini
    private func somePrivateMethod() {}         // hanya di dalam class
}

// Case 2
class SomeInternalClass {   // default internal
    var someInternalProperty = 0
    fileprivate func someFilePrivateMethod() {}
    private func somePrivateMethod() {}
}

// Case 3
fileprivate class SomeFilePrivateClass {
    func someFilePrivateMethod() {} // default fileprivate
    private func somePrivateMethod() {}
}

// Case 4
private class SomePrivateClass {
    func somePrivateMethod() {} // default private
}