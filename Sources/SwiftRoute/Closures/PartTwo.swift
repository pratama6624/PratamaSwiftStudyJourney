import Foundation

// Closure Expression Syntax
// Sample 1
let members: [(String, Int)] = [
    ("Rizal", 90),
    ("Adit", 75),
    ("Budi", 90),
    ("Tari", 85),
    ("Zara", 75)
]
// Full Closure Expression
let sortedMember = members.sorted(by: { (p1: (String, Int), p2: (String, Int)) -> Bool in
    if p1.1 != p2.1 {
        return p1.1 > p2.1 // sort by score
    } else {
        return p1.0 < p2.0 // sort by name
    }
})
print("\(sortedMember)\n---------------------------------------------------")
// Shorthand Closures
let sortedMemberVeryShorthandClosures = members.sorted {
    $0.1 != $1.1 ? $0.1 > $1.1 : $0.0 < $1.0
}
print("\(sortedMemberVeryShorthandClosures)\n---------------------------------------------------")

// Sample 2
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
]
/*
    [
        Student(name: "Eka", grade: 90, attendance: 1.0),
        Student(name: "Citra", grade: 90, attendance: 0.8),
        Student(name: "Dina", grade: 90, attendance: 0.8),
        Student(name: "Budi", grade: 85, attendance: 0.95),
        Student(name: "Andi", grade: 85, attendance: 0.9)
    ]
*/
// Shorthand Closures
let studentSortedd = students.sorted {
    if $0.grade != $1.grade {
        $0.grade > $1.grade
    } else if ($0.attendance != $1.attendance) {
        $0.attendance > $1.attendance
    } else {
        $0.name < $1.name
    }
}
print("\(studentSortedd)\n---------------------------------------------------")
// Very Shorthand Closures
let studentSorteddd = students.sorted {
    $0.grade != $1.grade ? $0.grade > $1.grade
        : ($0.attendance != $1.attendance
            ? $0.attendance > $1.attendance
                : $0.name < $1.name)
}
print("\(studentSorteddd)\n---------------------------------------------------")
// Full Closure Expression
let studentSorted = students.sorted (by: {(p1: Student, p2: Student) -> Bool in
    if p1.grade != p2.grade {
        return p1.grade > p2.grade
    } else if p1.attendance != p2.attendance {
        return p1.attendance > p2.attendance  
    } else {
        return p1.name < p2.name
    }
})
print("\(studentSorted)\n---------------------------------------------------")