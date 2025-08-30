import Foundation

struct Task: Equatable, Hashable, Comparable {
    let id: UUID
    let title: String
    let priority: Int
    let deadline: Date

    // MARK: - Equatable
    // To check if two are not the same (Usually just use id)
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }

    // MARK: - Hashable
    // So that it can be used in Set or Dictionary
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // MARK: - Comparable
    // For example, we want to sort tasks based on deadline
    static func < (lhs: Task, rhs: Task) -> Bool {
        return lhs.deadline < rhs.deadline
    }
}

let task1 = Task(id: UUID(), title: "Learning Swift", priority: 2, deadline: Date().addingTimeInterval(3000))
let task2 = Task(id: UUID(), title: "Build iOS Project", priority: 1, deadline: Date().addingTimeInterval(7200))
let task3 = Task(id: task1.id, title: "Learning Swift (Duplicate)", priority: 2, deadline: Date().addingTimeInterval(3600))

// 1. Equatable
print(task1 == task3) // true because same id
print(task1 == task2) // false

// 2. Hashable
var taskSet: Set<Task> = [task1, task2, task3]
print(taskSet.count)

// 3. Comparable
let sortedTasks = [task1, task2].sorted()
print(sortedTasks.map { $0.title })


