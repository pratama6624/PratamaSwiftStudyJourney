// Without Generics
func swapInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

func swapStrings(_ a: inout String, _ b: inout String) {
    let temp = a
    a = b
    b = temp
}

// With Generics
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var number1 = 10
var number2 = 20
swapInts(&number1, &number2)
print(number1, number2) // 20 10

var name1 = "Pratama"
var name2 = "Swift"
swapValues(&name1, &name2)
print(name1, name2) // Swift Pratama

