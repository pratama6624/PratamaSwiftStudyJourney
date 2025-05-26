import Foundation

// Stored Properties
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// rangeOfThreeItems = (0, 1, 2)
rangeOfThreeItems.firstValue = 5
// rangeOfThreeItems = (5, 6, 7)

// Stored Properties of Constant Structure Instances
let consRangeOfFourItems = FixedLengthRange(firstValue: 4, length: 3)
// consRangeOfFourItems.firstValue = 5 // Error compiling

// Lazy Stored Properties
// Sample from apple docs
class DataImporter {
    var filename = "data.txt"
}
class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
}
let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// Just made here
print("filename is \(manager.importer.filename)")
// Sample form chatGPT
struct DataLoader {
    lazy var data: [String] = {
        print("🔄 Loading data...")
        return ["Apple", "Banana", "Cherry"]
    }()
}
var loader = DataLoader()
print("✅ DataLoader created") // There isn't any yet
print(loader.data) // just made here

// Stored Properties and Instance Variables
// Swift stores properties and data storage in 1 simple declaration
// Sample from apple docs
class User {
    var name: String = "Pratama"
}

// Computed Properties
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Sample from chatGPT
struct Rectangle {
    var width: Double
    var height: Double

    var area: Double {
        return width * height
    }
}
let box = Rectangle(width: 5, height: 10)
print("Box area is \(box.area)")

// Shorthand Setter Declaration
// Shorthand Getter Declaration
// Sample apple dosc
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
// Sample chatgpt
struct Celsius {
    var temperatureInCelsius: Double
    var temperatureInFahrenheit: Double {
        get {
            return (temperatureInCelsius * 9/5) + 32
        }
        set {
            temperatureInCelsius = (newValue - 32) * 5/9
        }
    }
}
// call Celcius struct with first fahrenheit param
var temp = Celsius(temperatureInCelsius: 0)
temp.temperatureInFahrenheit = 212
print("Now temp in celcius is \(temp.temperatureInCelsius)")
// sample chatgpt 2
class Wallet {
    var moneyInTheBank: Int
    var moneyInTheWallet: Int

    var totalMoney: Int {
        get {
            return moneyInTheBank + moneyInTheWallet
        }
        set {
            // For example: you always want pocket money of 10% of your total money
            moneyInTheWallet = Int(Double(newValue) * 0.1)
            moneyInTheBank = newValue - moneyInTheWallet
        }
    }

    init(moneyInTheBank: Int, moneyInTheWallet: Int) {
        self.moneyInTheBank = moneyInTheBank
        self.moneyInTheWallet = moneyInTheWallet
    }
}
var myMoney = Wallet(moneyInTheBank: 0, moneyInTheWallet: 0)
myMoney.totalMoney = 2_000_000
print("Now my money in the wallet is \(myMoney.moneyInTheWallet)")
print("Now my money in the bank is \(myMoney.moneyInTheBank)")
// Sample chatgpt 3
struct Person {
    var height: Double
    var weight: Double

    var bmi: Double {
        get {
            return weight / (height * height)
        }
        set {
            weight = newValue * (height * height)
        }
    }
}
var person = Person(height: 1.72, weight: 70)
print("BMI now \(person.bmi)")
person.bmi = 23.6
print("Ideal weight for BMI 23.6: \(person.weight)")
// Exam 1
struct Battery {
    var capacity: Int
    var used: Int

    var remainingPercentage: Int {
        get {
            return Int((Double(capacity - used) / Double(capacity)) * 100)
        }
        set {
            used = capacity - Int(Double(newValue) / 100 * Double(capacity))
        }
    }
}
var myBattery = Battery(capacity: 4000, used: 1000)
print("Remaining is \(myBattery.remainingPercentage)") // 75
myBattery.remainingPercentage = 75
print(myBattery.used) // 1000

// Read-Only Computed Properties
// Sample from apple docs
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// Sample from chatgpt
struct Transaction {
    var amount: Double
    var date: Date
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}
let transaksi = Transaction(amount: 200_000, date: Date())
print("Date of transaction : \(transaksi.formattedDate)")

// Property Observers