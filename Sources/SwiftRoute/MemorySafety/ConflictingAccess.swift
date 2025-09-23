import Foundation

var balance = 100

func update(_ bal: inout Int) {
    bal += 50
}

// Safe
update(&balance)

// Not Safe -> Compile time error
func addAndUpdate(_ bal: inout Int) {
    bal += balance
}

addAndUpdate(&balance) // Fatal Error