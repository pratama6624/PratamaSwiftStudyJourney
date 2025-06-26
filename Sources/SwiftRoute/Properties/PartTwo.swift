import Foundation

// Property Wrapper (Sample from apple docs)
print("Property Wrapper sample apple docs output")
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set {
            // All values above equal to 12 will be set to 12
            number = min(newValue, 12)
        }
    }
}
// With syntax @TwelveOrLess (Auto)
struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}
var rectangle = SmallRectangle()
rectangle.height = 23 // 12
rectangle.width = 9 // 9
print("Rectangle height: \(rectangle.height) and width \(rectangle.width)") // 12 & 9
// Without syntax @TwelveOrLess (Manual)
struct SmallReacAngle {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()

    var height: Int {
        get { _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}
var smallrectagle = SmallReacAngle()
smallrectagle.height = 10 // 10
smallrectagle.width = 30 // 30
print("Rectangle height \(smallrectagle.height) and width \(smallrectagle.width)") // 10

// Property Wrapper (Sample from chatgpt)
// Validation
print("Property Wrapper sample chat gpt output")
@propertyWrapper
struct UsernameLenght {
    private var value: String = ""

    var wrappedValue: String {
        get { value }
        set { value = newValue.count <= 12 ? newValue : String(newValue.prefix(12)) }
    }
}
// Auto
struct User {
    @UsernameLenght var name: String
}
var user = User()
user.name = "@kukuhnurpratama"
print("username is \(user.name)")
// Manual
struct UserAccount {
    private var _value = UsernameLenght()
    var name: String {
        get { return _value.wrappedValue }
        set { _value.wrappedValue = newValue }
    }
}
var username = UserAccount()
username.name = "@pratamanurkukuh"
print("Username is \(username.name)")

// Property Wrapper (Sample from chatgpt)
// Auto-Trim String Input
print("Property Wrapper sample chat gpt output")
@propertyWrapper
struct Trimmed {
    private var value: String = ""

    var wrappedValue: String {
        get { return value }
        set { value = newValue.trimmingCharacters(in: .whitespacesAndNewlines) }
    }
}
// Auto
struct FormInput {
    @Trimmed var name: String
}
var input = FormInput()
input.name = "  @pratama6624    "
print("Username is \(input.name)")
// Manual
struct FormInputUser {
    private var _value = Trimmed()

    var name: String {
        get { return _value.wrappedValue }
        set { return _value.wrappedValue = newValue  }
    }
}
var userinput = FormInput()
userinput.name = "      @pratamanur     "
print("Username is \(userinput.name)")

// Property Wrapper (Sample from chatgpt)
// Clamped Number (0–100)
print("Property Wrapper sample chat gpt output")
@propertyWrapper
struct Clamped {
    private var value: Int = 0
    var wrappedValue: Int {
        get { return value }
        set { return value = min(max(newValue, 0), 100) }
    }
}
// Auto
struct BrightnessSetting {
    @Clamped var brightness: Int
}
var bright = BrightnessSetting()
bright.brightness = 110 // 100
print("Brigness set to \(bright.brightness)")
bright.brightness = -1 // 0
print("Brigness set to \(bright.brightness)")
bright.brightness = 56 // 56
print("Brigness set to \(bright.brightness)")

// Re-fresh
print("\n=== Property Wrapper MaxLength Sample ===")
@propertyWrapper
struct MaxLength {
    private var value: String = ""
    var wrappedValue: String {
        get { value }
        set { value = String(newValue.prefix(12))}
    }
}

struct AccountUser {
    @MaxLength var username: String
}

var userMax = AccountUser()
userMax.username = "pratamakingdom"
print("Username: \(userMax.username)") // Output: "pratamakingd"
userMax.username = "tama"
print("Username: \(userMax.username)") // Output: "tama"
userMax.username = "theSwiftDeveloperPro"
print("Username: \(userMax.username)") // Output: "theSwiftDeve"
