// Automatic Way
// Equatable
struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let v1 = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let v2 = Vector3D(x: 2.0, y: 3.0, z: 4.0)

if v1 == v2 {
    print("These two vectors are also equivalent.")
} else {
    print("Both are not the same")
}

// Hashable
struct User: Hashable { 
    var id: Int
    var username: String
}

let u1 = User(id: 1, username: "pratama")
let u2 = User(id: 2, username: "bree")

var set: Set<User> = [u1, u2]
print(set.contains(u1))

// Comparable
enum SkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(start: Int)
}

var levels: [SkillLevel] = [
    .intermediate,
    .beginner,
    .expert(start: 5),
    .expert(start: 3)
]

for level in levels.sorted() {
    print("level is \(level)")
}