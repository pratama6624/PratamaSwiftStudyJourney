import Foundation

// Challenge 1 -> Filter, Map & Reduce
struct Student {
    let name: String
    let grade: Int
    let attendance: Double
}
let students: [Student] = [
    Student(name: "Andi", grade: 85, attendance: 0.9),
    Student(name: "Budi", grade: 85, attendance: 0.95),
    Student(name: "Citra", grade: 90, attendance: 0.8),
    Student(name: "Dina", grade: 90, attendance: 0.8),
    Student(name: "Eka", grade: 90, attendance: 1.0),
    Student(name: "Vani", grade: 78, attendance: 0.98),
]
// Filter
let filterStudent = students.filter { $0.grade >= 80 && $0.attendance >= 0.9 }
print("\(filterStudent)")
// Map
let mapFilterStudents = filterStudent.map { (Double($0.grade * 2)) + ($0.attendance * 100) }
print("\(mapFilterStudents)")
// Reduce
let reduceMapFilterStudents = mapFilterStudents.reduce(0) { $0 + $1 }
print("Reduce is \(reduceMapFilterStudents)")
// 1 Line | In one chain
let filterStudentInOneChain = students
    .filter { $0.grade >= 80 && $0.attendance >= 0.9 }
    .map { (Double($0.grade * 2)) + ($0.attendance * 100) }
    .reduce(0) { $0 + $1 }
print("In one chain \(filterStudentInOneChain)")

// Challenge 2 -> Filter, Map & Reduce