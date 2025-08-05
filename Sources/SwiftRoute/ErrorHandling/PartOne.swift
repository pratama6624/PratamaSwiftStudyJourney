import Foundation

// Representing and Throwing Errors
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
// Nothing happened
// throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

// Handling Errors
// Propagating Errors Using Throwing Functions
enum CustomError: Error {
    case errorDivideByZero
    case invalidOperator
}
func calculator(one: Int, operator: String, two: Int) throws -> Double {
    switch `operator` {
        case "+":
            return Double(one + two)
        case "-":
            return Double(one - two)
        case "*":
            return Double(one * two)
        case "/":
            if `two` == 0 {
                throw CustomError.errorDivideByZero
            }
            return Double(one) / Double(two)
        default:
            throw CustomError.invalidOperator
    }
}

print("2 + 2 = \(try calculator(one: 2, operator: "+", two: 2))")
print("2 - 2 = \(try calculator(one: 2, operator: "-", two: 2))")
print("2 * 2 = \(try calculator(one: 2, operator: "*", two: 2))")
// print("2 / 2 = \(try calculator(one: 2, operator: "/", two: 0))")

print("------------------------------------------------------")

// Handling Errors Using Do-Catch (Try Catch)
func calculatorTest(one: Int, operator: String, two: Int) {
    do {
        let data = try calculator(one: `one`, operator: `operator`, two: `two`)
        print("\(one) \(`operator`) \(two) = \(data)")
    } catch CustomError.errorDivideByZero {
        print("Error : Divide by zero")
    } catch CustomError.invalidOperator {
        print("Error : Invalid operator")
    } catch {
        print("Error : I don't know it")
    }
}

print("2 + 2 = \(calculatorTest(one: 2, operator: "+", two: 2))\n")
print("2 - 2 = \(calculatorTest(one: 2, operator: "-", two: 2))\n")
print("2 * 2 = \(calculatorTest(one: 2, operator: "*", two: 2))\n")
print("2 / 2 = \(calculatorTest(one: 2, operator: "/", two: 2))\n")
print("2 / 2 = \(calculatorTest(one: 2, operator: "/", two: 0))\n")

// Converting Errors to Optional Values
func getNumber() throws -> Int {
    throw NSError(domain: "bro.error", code: 1)
    // return 99
}
let number = try? getNumber()
if number == nil {
    print("nil")
}

// Disabling Error Propagation
/* 
    Pasti error karena kita yakin kalo nilainya pasti ada
    sedangkan fungsi getNumber disini menghasilkan nil
*/
// let num = try! getNumber()

// Specifying the Error Type
enum StatisticsError: Error {
    case noRatings
    case invalidRating(Int)
}
func summarize(_ ratings: [Int]) throws(StatisticsError) {
    guard !ratings.isEmpty else { throw .noRatings }

    var counts = [1: 0, 2: 0, 3: 0]
    for rating in ratings {
        guard rating >= 1 && rating <= 3 else {
            throw .invalidRating(rating)
        }
        counts[rating]! += 1
    }

    print("*", counts[1]!, "-- **", counts[2]!, "-- ***", counts[3]!)
}

let rating = [1, 2, 3, 2, 2, 1]

do {
    try summarize(rating)
} catch {
    switch error {
        case .noRatings:
            print("Gak ada rating")
        case .invalidRating(let rating):
            print("Rating gak valid: \(rating)")
        default:
            print("Error lain") // Ini gak bakal kejadian karena typed error
    }
}

// Never Throws -> Ga boleh sama sekali ada throw disini
func nonThrowingFunction() throws(Never) {
    // Jangan sampai ada throws disini
}

// Block do throws
do throws(StatisticsError) {
    try summarize([])
} catch {
    switch error {
    case .noRatings:
        print("Kosong bro")
    case .invalidRating(let r):
        print("Gak valid: \(r)")
    }
}

// Free -> All
func throwAnything() throws {
    // You can throw anything here
}

// Specifying Cleanup Actions
/*
    Defer -> Fungsi yang akan selalu dijalankan sebelum keluar scope
    Baik itu menghasilkan error atau tidak
    Janji defer akan selalu ditepati
*/
func processFile(filename: String) throws {
    if FileManager.default.fileExists(atPath: filename) {
        
        // Pakai try buat baca file
        let content = try String(contentsOfFile: filename)
        
        defer {
            print("File processing finished!")
        }
        
        for line in content.components(separatedBy: .newlines) {
            print("Line:", line)
        }
    } else {
        print("File not found at path:", filename)
    }
}
try processFile(filename: "Ngarang")

// Urutan LIFO (Last In First Out)
func multipleDefers() {
    defer { print("🚪 1") }
    defer { print("🚪 2") }
    defer { print("🚪 3") }

    print("Inside function")
}
multipleDefers()