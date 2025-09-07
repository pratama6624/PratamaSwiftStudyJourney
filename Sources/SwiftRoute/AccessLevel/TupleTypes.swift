// Sample
internal struct Person {
    var name: String
}

private struct SecretCode {
    var code: Int
}

// Gabungan jadi tuple
let data: (Person, SecretCode) // Error karena SecretCode private

public struct User {
    var id: Int
}

internal struct Account {
    var balance: Double
}

// Tuple gabungan
let accountInfo: (User, Account)