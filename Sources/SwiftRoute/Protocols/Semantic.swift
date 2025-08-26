protocol MarkerProtocol { }

struct Transaction: MarkerProtocol {
    let id: String
    let amount: Double
}

func logIfMarker<T>(_ value: T) {
    if value is MarkerProtocol {
        print("This type is marked with MarkerProtocol")
    } else {
        print("Not marked")
    }
}

logIfMarker(Transaction(id: "TX123", amount: 5_000))
logIfMarker("Hello")