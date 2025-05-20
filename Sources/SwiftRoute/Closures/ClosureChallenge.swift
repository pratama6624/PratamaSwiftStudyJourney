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
print("-------------------------------------------------------")


// Challenge 3 -> Leaderboard Category Challenge
struct Player {
    let name: String
    let score: Int
    let level: String // "Beginner", "Intermediate", "Expert"
}
let players: [Player] = [
    Player(name: "Andi", score: 120, level: "Beginner"),
    Player(name: "Budi", score: 150, level: "Intermediate"),
    Player(name: "Citra", score: 200, level: "Expert"),
    Player(name: "Dina", score: 180, level: "Expert"),
    Player(name: "Eka", score: 130, level: "Beginner"),
    Player(name: "Fikri", score: 160, level: "Intermediate"),
    Player(name: "Gina", score: 190, level: "Expert"),
    Player(name: "Hadi", score: 100, level: "Beginner"),
    Player(name: "Intan", score: 140, level: "Intermediate"),
    Player(name: "Joko", score: 170, level: "Expert")
]
/* Sample output
    [
        "Beginner": ["Eka", "Andi"],
        "Intermediate": ["Fikri", "Budi"],
        "Expert": ["Citra", "Dina"]
    ]
*/
/* Objective
    1. Group players by their level (Beginner, Intermediate, Expert)
    2. Sort players inside each group by their score descending
    3. Get top 2 player
    4. Output dictionary -> [String: [String]]
*/
// Grouping
let groupedPlayer = Dictionary(grouping: players) { $0.level }
// print("\(groupedPlayer)")
// Sorting
let sortedGroupedPlayer = groupedPlayer.mapValues { players in
    players.sorted { $0.score > $1.score }.prefix(2).map { $0.name }
}
// print("\(sortedGroupedPlayer)")
// 1 Line | Clean code
let bestPlayer = Dictionary(grouping: players) { $0.level }
    .mapValues { players in
        players.sorted { $0.score > $1.score }
            .prefix(2)
            .map { $0.name }
    }
print("Best players \(bestPlayer)")


