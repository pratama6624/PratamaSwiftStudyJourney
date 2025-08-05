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
let num = try! getNumber()