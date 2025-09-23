var number = [1, 2, 3]
print(number[1]) // Safe
// print(number[4]) // Danger -> Not Safe (Index out of bound)

var x = 10
var y = x

x = 20 // Safe -> Because y has its own copy (value type)

var number2 = [1, 2, 3]

func update(_ arr: inout [Int]) {
    arr[0] = 100
}

update(&number2) // Safe
// update(&number2[0]) // Compile time error

