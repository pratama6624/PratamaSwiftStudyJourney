// Instance Methods
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by: Int) {
        count += by
    }
    func reset() {
        count = 0
    }
}
let counter = Counter()
counter.increment()
print("Counter : \(counter.count)")
counter.increment(by: 5)
print("Counter : \(counter.count)")
counter.reset()
print("Counter : \(counter.count)")

// The self Property
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
    // Modifying Value Types from Within Instance Methods
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("\nThis point is to the right of the line where x == 1.0")
}
somePoint.moveBy(x: 2.0, y: 3.0)

// Modifying Value Types from Within Instance Methods
print("Move to x: \(somePoint.x), y:\(somePoint.y)")
let fixedPoint = Point(x: 3.0, y: 3.0)
// fixedPoint.moveBy(x: 2.0, y: 3.0) // Error

// Assigning to self Within a Mutating Method
print("")
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
            case .off:
                self = .low
            case .low:
                self = .high
            case .high:
                self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
if ovenLight == .high { print(".high") }
ovenLight.next()
if ovenLight == .off { print(".off") }

// Type Methods
print("")
struct MathUtil {
    static func double(_ x: Int) -> Int {
        return x * 2
    }
}
print("\(MathUtil.double(4))\n")

// study case
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <=  highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String

    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }

    init(name: String) {
        self.playerName = name
    }
}

LevelTracker.unlock(100)

// How to use
var player = Player(name: "Anggi")
player.complete(level: 1)
print("Current level : \(player.tracker.currentLevel)")
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

var player2 = Player(name: "Angga")
player2.complete(level: 22)
print("Current level : \(player2.tracker.currentLevel)")
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

var player3 = Player(name: "Ika")
player3.complete(level: 13)
print("Current level : \(player3.tracker.currentLevel)")
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

// Type Method
class SomeClass {
    class func someTypeMethod() {
        // Code here
    }
}
SomeClass.someTypeMethod()