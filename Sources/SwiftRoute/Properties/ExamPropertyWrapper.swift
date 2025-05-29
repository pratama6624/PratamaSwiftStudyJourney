import Foundation

// Exam 1 Property Wrapper - Minimum Length Validation (Easy Level)
@propertyWrapper
struct MinLength {
    private var value: String = ""
    var wrappedValue: String {
        get { return value }
        set { value = newValue.count <= 3 ? newValue : "N/A" }
    }
}
// Auto
struct User {
    @MinLength var name : String
}
var user = User()
user.name = "@Pratama"
print("Name for user is \(user.name)")
// Manual
struct AnotherUser {
    private var _value = MinLength()
    var name: String {
        get { _value.wrappedValue }
        set { _value.wrappedValue = newValue }
    }
}
var anotherUser = AnotherUser()
anotherUser.name = "@Pratama"
print("Name for another user is \(anotherUser.name)")

// Exam 2 Property Wrapper - Number Range (Medium Level)
@propertyWrapper
struct Clamped {
    private var percentage: Int = 0

    var wrappedValue: Int {
        get { return percentage }
        set { percentage = newValue < 0 ? 0 : (newValue > 100 ? 100 : newValue) }
    }
}
// Auto
struct Progress {
    @Clamped var percentage: Int
}
var progress = Progress()
progress.percentage = -10
print("Percentage set to \(progress.percentage)")
progress.percentage = 50
print("Percentage set to \(progress.percentage)")
progress.percentage = 150
print("Percentage set to \(progress.percentage)")
// Manual
struct AnotherProgress {
    private var _percentage = Clamped()

    var percentage: Int {
        get { return _percentage.wrappedValue }
        set { _percentage.wrappedValue = newValue }
    }
}
var anotherProgress = AnotherProgress()
anotherProgress.percentage = -10
print("Percentage another progress set to \(anotherProgress.percentage)")
anotherProgress.percentage = 50
print("Percentage another progress set to \(anotherProgress.percentage)")
anotherProgress.percentage = 150
print("Percentage another progress set to \(anotherProgress.percentage)")