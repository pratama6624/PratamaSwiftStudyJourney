// Sample Basic
class UserManager {
    private var users: [String] = []

    func addUser(_ name: String) {
        users.append(name)
    }

    func getAllUsers() -> [String] {
        return users
    }
}

// File: MainView.swift
let manager = UserManager()
// manager.users  ❌ ERROR, karena `users` private
manager.addUser("Pratama")
print(manager.getAllUsers()) // ✅ bisa