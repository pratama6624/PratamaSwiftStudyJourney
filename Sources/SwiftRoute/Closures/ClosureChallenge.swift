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

print("-------------------------------------------------------")


// Challenge 2 -> Filter, Map & Reduce
// Note (for challege 2) -> Any function that produces a dictionary will break the order
// So.... Dictionary === Break the order
struct Member {
    let name: String
    let grade: Int
    let attendance: Double
    let isActive: Bool
}
let members: [Member] = [
    Member(name: "Andi", grade: 85, attendance: 0.95, isActive: true),
    Member(name: "Budi", grade: 88, attendance: 0.75, isActive: true),
    Member(name: "Citra", grade: 92, attendance: 0.9, isActive: false),
    Member(name: "Dina", grade: 91, attendance: 1.0, isActive: true),
    Member(name: "Eka", grade: 79, attendance: 0.85, isActive: true),
    Member(name: "Fikri", grade: 94, attendance: 0.97, isActive: true),
    Member(name: "Gina", grade: 80, attendance: 0.99, isActive: false),
    Member(name: "Hadi", grade: 90, attendance: 0.88, isActive: true)
]
/* Provision
    1. Get is active = true && grade >= 90
    2. finalScore = grade + (attendance * 10)
    3. Get 3 members with the highest scores
    4. The output is an array in descending order
*/
/* Step by Step
    1. Filter it
    2. Reduce it
    3. Sort it
*/
// Filter
let filterMember: [Member] = members.filter { $0.attendance >= 0.9 && $0.isActive == true }
// print("Filter it \(filterMember)")
// Reduce it
let reduceFilterMember: [String: Double] = filterMember.reduce(into: [String: Double]()) { result, member in
    result[member.name] = Double(member.grade) + Double(member.attendance * 10)
}
// print("Reduce it \(reduceFilterMember)")
// Sort it
let sorted = reduceFilterMember.sorted { $0.value > $1.value }
print("Sorted array \(sorted)")
// Note Dictionary == Random Sort
let topSortReduceFilterMember = Dictionary.init(uniqueKeysWithValues: Array(sorted.prefix(3)))
// print("Sort it \(topSortReduceFilterMember)")
// 1 Line | In one chain
let top3FinalScore = Array(members
    .filter { $0.attendance >= 0.9 && $0.isActive == true }
    .reduce(into: [String: Double]()) { result, member in
        result[member.name] = Double(member.grade) + Double(member.attendance * 10)
    }
    .sorted { $0.value > $1.value }.prefix(3))
print("1 Line \(top3FinalScore)")
// 1 Line | Clean Code
let top3FinalScoreClean = members
    .filter { $0.attendance >= 0.9 && $0.isActive == true }
    .map { ($0.name, Double($0.grade) + $0.attendance * 10) }
    .sorted { $0.1 > $1.1 }
    .prefix(3)
    // .reduce(into: [String: Double]()) { result, item in
    //     result[item.0] = item.1
    // }
print("Clean \(top3FinalScoreClean)")