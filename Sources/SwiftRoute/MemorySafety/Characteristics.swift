// Instan Access
func oneMore(than number: Int) -> Int {
    return number + 1 // read (instan)
}

var myNumber = 1
myNumber = oneMore(than: myNumber) // write (instan)
print(myNumber) // read (instan)

// Long term Access Example
var balance = 100
func updateBalance(_ bal: inout Int) {
    bal += 50 // write (long term because inout)
}

// Is safe
updateBalance(&balance)
// Conflict -> Error
func addAndPrint(_ bal: inout Int) {
    bal += balance // write bal + read balance -> same memory location
}

addAndPrint(&balance) // Compile time error -> Conflict