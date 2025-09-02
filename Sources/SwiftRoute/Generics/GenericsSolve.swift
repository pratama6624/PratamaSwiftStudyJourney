func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporary = a
    a = b
    b = temporary
}

var angka1 = 10
var angka2 = 20
swapTwoValues(&angka1, &angka2)
print("angka1: \(angka1), angka2: \(angka2)") 
// angka1: 20, angka2: 10

var kata1 = "Swift"
var kata2 = "iOS"
swapTwoValues(&kata1, &kata2)
print("kata1: \(kata1), kata2: \(kata2)") 
// kata1: iOS, kata2: Swift

var desimal1 = 3.14
var desimal2 = 2.71
swapTwoValues(&desimal1, &desimal2)
print("desimal1: \(desimal1), desimal2: \(desimal2)")
// desimal1: 2.71, desimal2: 3.14