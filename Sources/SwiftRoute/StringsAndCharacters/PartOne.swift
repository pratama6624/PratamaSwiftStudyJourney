import Foundation

// String Literal
var literalString = "Some String Literal Value"
print("\(literalString)\n--------------------------------------")

// String Multiline
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print("\(quotation)\n--------------------------------------")

let singleLineString = "These are the same"
let multiLineString = """
These are the same
"""
print("\(singleLineString) \(multiLineString)\n--------------------------------------")

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print("\(softWrappedQuotation)\n--------------------------------------")

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
print("\(lineBreaks)\n--------------------------------------")

// Special Characters in String Literals
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
print("\(wiseWords)")
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"
print("\(dollarSign) \(blackHeart) \(sparklingHeart)\n--------------------------------------")

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\""\"""
"""
print("\(threeDoubleQuotationMarks)\n--------------------------------------")

// Extended String Delimiters
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
print("\(threeMoreDoubleQuotationMarks)\n--------------------------------------")
var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty && anotherEmptyString.isEmpty {
    print("Nothing to see here\n--------------------------------------")
}

// String Mutability
var variableString = "One"
variableString += " and Two"
print("\(variableString)\n--------------------------------------")
let constantString = "Three"
// constantString += " and Four" // Error
print("\(constantString) and Four")

// Strings Are Value Types
/*
    Di swift jika kita memiliki a dan dicopy ke b
    maka nilai a baru akan benar-benar di copy ke b jika salah satunya berubah
*/
var a = "Hello World"
var b = a // copy logis, belum copy memory
print(a)
print(b)
b += "!!!" // jika a atau b berubah, Swift copy dulu sebelum ubah, b tetap aman
print(a)
print("\(b)\n--------------------------------------")