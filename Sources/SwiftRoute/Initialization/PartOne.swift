// Initialization
// Setting Initial Values for Stored Properties
struct Fahrenheit {
    var temperature: Double
    init() {
        // Default Property Values
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")

// Customizing Initialization
// Initialization Parameters
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print("Boiling of water is \(boilingPointOfWater)")
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print("Freezing of water is \(freezingPointOfWater)")

// Parameter Names and Argument Labels
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
print("Magenta is \(magenta)")
let halfGray = Color(white: 0.5)
print("Half Gray is \(halfGray)")

// Initializer Parameters Without Argument Labels
let bodyTemperature = Celsius(37.0)
print("Body Temperature is \(bodyTemperature)")

// Optional Property Types
class SurveyQuestion {
    var text: String
    // Assigning Constant Properties During Initialization
    // let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese"
// Optional Handling
if let response = cheeseQuestion.response {
    print("Response: \(response)")
} else {
    print("Not answered yet")
}

let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask()
// beetsQuestion.response = "I also like beets. (But not with cheese.)"
// Optional Handling
if let likeBeetsResponse = beetsQuestion.response {
    print("Like beets: \(likeBeetsResponse)")
} else {
    print("Not answered yet")
}

// Default Initializers
class ShoppingListItem {
    var name: String?
    // Default = 1
    var quantity = 1
    // Default = false
    var purchased = false
}
var item = ShoppingListItem()

// Memberwise Initializers for Structure Types
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)
print("Two by two is \(twoByTwo.width) \(twoByTwo.height)")
let zeroByTwo = Size(height: 2.0)
print("Zero by two is \(zeroByTwo.width) \(zeroByTwo.height)")
let zeroByZero = Size()
print("Zero by zero is \(zeroByZero.width) \(zeroByZero.height)")

// Initializer Delegation for Value Types
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let basicRect = Rect()
print("Basic rect origin is \(basicRect)")
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
print("Rect origin is \(originRect)")
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
print("center rect origin is \(centerRect)")

// Class Inheritance and Initialization
// Designated Initializers and Convenience Initializers
// Syntax for Designated and Convenience Initializers
// Initializer Inheritance and Overriding
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

class HoverBoard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // super.init() implicitly called here
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}
let hoverboard = HoverBoard(color: "silver")
print("Hoverboard: \(hoverboard.description)")

// Automatic Initializer Inheritance

// Designated and Convenience Initializers in Action
// Note: Fungsinya adalah sama dengan init() untuk membuat object tanpa nama
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
let a = Food(name: "Pizza")
print("A is \(a.name)")
let b = Food()
print("B is \(b.name)")

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
let oneMysteryItem = RecipeIngredient()
print("One mystery item is \(oneMysteryItem.name) with quantity is \(oneMysteryItem.quantity)")
let oneBacon = RecipeIngredient(name: "Bacon")
print("One Bacon is \(oneBacon.name) with quantity is \(oneBacon.quantity)")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
print("Six eggs is \(sixEggs) with quantity is \(sixEggs.quantity)")
print("")

class ShoppingList: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}
var breakfastList = [
    ShoppingList(),
    ShoppingList(name: "Bacon"),
    ShoppingList(name: "Eggs", quantity: 6)
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

// Failable Initializers
let wholeNumber: Double = 12345.0
let pi = 3.14159

if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
}

let valueChanged = Int(exactly: pi)
if valueChanged == nil {
    print("\(pi) conversion to Int doesn't maintain value")
}

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("The anonymous creature couldn't be initialized")
}

// Failable Initializers for Enumerations
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
            case "K":
                self = .kelvin
            case "C":
                self = .celsius
            case "F":
                self = .fahrenheit
            default:
             return nil
        }
    }
}

// Failable Initializers for Enumerations with Raw Values
enum TemperatureUnitNew: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}
let fahrenheitUnit = TemperatureUnitNew(rawValue: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
let unknownUnit = TemperatureUnitNew(rawValue: "X")
if unknownUnit == nil {
    print("This isn't a defined temperature unit, so initialization failed.")
}

// Propagation of Initialization Failure
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}
// Name: sock, quantity: 2
if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
// Name: shirt, quantity: 0
// Unable to initialize zeroshirts
if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zeroshirts")
}
// Name: Unnamed, quantity: 1
// Unable to initialize one unnamed product
if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}

// Overriding a Failable Initializer
class Document {
    var name: String?
    // this initializer creates a document with a nil name value
    init() { }
    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}
class AutomaticallyNamedDoccument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}
let doc = Document() // Name = nil
// Optional Handling
if let docName = doc.name {
    print("Doc name is \(docName)")
} else {
    print("Doc name is nil")
}
let doc1 = Document(name: "My Files") // Name = My Files
// Optional Handling
print("Doc 1 name is \(doc1?.name ?? "tanpa nama")")
let doc2 = Document(name: "") // Return nil
// Optional Handling
print("Doc 2 name is \(doc2?.name ?? "tanpa nama")")

// Auto
let auto1 = AutomaticallyNamedDoccument() // name = "[Untitled]"
// Optional Handling
print("Doc auto 1 name is \(auto1.name ?? "")")
let auto2 = AutomaticallyNamedDoccument(name: "Notes") // name = "Notes"
// Optional Handling
print("Doc auto 2 name is \(auto2.name ?? "")")
let auto3 = AutomaticallyNamedDoccument(name: "") // name = "[Untitled]"
// Optional Handling
print("Doc auto 3 name is \(auto3.name ?? "")")

// Required Initializers
class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}
class SomeSubClass: SomeClass {
    required init() {
        // // subclass implementation of the required initializer goes here
    }
}

// Setting a Default Property Value with a Closure or Function
struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard: [Bool] = []
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}
let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1))
// Prints "true"
print(board.squareIsBlackAt(row: 7, column: 7))
// Prints "false"