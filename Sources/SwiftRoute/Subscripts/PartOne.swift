// Subscript Syntax
let angka = [1, 2, 3]
print("Index 0 is \(angka[0])") // Akses via subscript

// Subscript Read-Only
struct TimeTable {
    let multiplier: Int

    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
// How to use
let threeTime = TimeTable(multiplier: 3)
print("6 * 3 = \(threeTime[6])")

// Subscript Read-Write
struct Matrix {
    var grid: [[Int]]

    subscript(row: Int, column: Int) -> Int {
        get {
            return grid[row][column]
        }
        set {
            grid[row][column] = newValue
        }
    }
}
// How to use
var m = Matrix(grid: [[1, 2], [3, 4]])
m[0, 1] = 9
// print(m[0, 1]) // 9
print(m)

// Subscript Usage
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2
numberOfLegs["dog"] = 4
print(numberOfLegs)

// Subscript Options
struct MatrixX {
    let rows: Int, columns: Int
    var grid: [Double]

    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }

    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }

    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
// How to use
var matrix = MatrixX(rows: 3, columns: 3)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
print(matrix)
// matrix[3, 3] = 1.5 // Out of bounds

// Type Subscripts
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)