import Foundation

let shiftBits = 4
let shiftedLeft     = shiftBits << 1 // Result = 00001000 (8)
let shiftedRight    = shiftBits >> 1 // Result = 00000010 (2)

print("shiftedLeft:", shiftedLeft)
print("shiftedRight:", shiftedRight)

struct Permissions: OptionSet {
    let rawValue: Int

    static let read = Permissions(rawValue: 1 << 0) // 0001
    static let write = Permissions(rawValue: 1 << 1) // 0010
    static let execute = Permissions(rawValue: 1 << 2) // 0100
}

var userPermissions: Permissions = [.read, .write]

print(userPermissions.contains(.read))    // true
print(userPermissions.contains(.execute)) // false

userPermissions.insert(.execute)
print(userPermissions.contains(.execute)) // true