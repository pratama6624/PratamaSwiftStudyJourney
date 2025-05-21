import Foundation

// Inferring Type From Context
// Note : Swift will automatically know the data type of the parameter
let names = ["Bayu", "Andi", "Citra", "Dian"]
let reversedNames = names.sorted(by: { p1, p2 in return p1 > p2 })
print("Reversed names \(reversedNames)")

// Implicit Returns from
let numbers = [2, 6, 1, 9, 7, 5, 6]
let sortedNumber = numbers.sorted(by: { p1, p2 in p1 > p2 })
print("Sorted number \(sortedNumber)")

// Shorthand Argument Names
let members = [7, 1, 5, 2, 9, 3, 6]
let sortedMember = members.sorted(by: { $0 > $1 })
print("Sorted member \(sortedMember)")

// Operator Methods
// >

// Trailing Closures
let player = ["Pratama", "Yena", "Yuji", "Nur", "Young", "Anna"]
let sortedPlayer = player.sorted { $0 > $1 }
print("Sorted player \(sortedPlayer)")

// Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func increment() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return increment
}

var counterA = makeIncrementer(forIncrement: 3)
print("Counter A : \(counterA())")
print("Counter A : \(counterA())")
print("Counter A : \(counterA())")

// Closures Are Reference Types
let counterB = makeIncrementer(forIncrement: 2)
let counterC = counterB
print("Counter B : \(counterB())") // Leading to the same closure
print("Counter C : \(counterC())") // Leading to the same closure
print("Counter B : \(counterB())") // Leading to the same closure

// Escaping
// Nonescaping Closure
func sayHelloNow(closure: () -> Void) {
    closure()
}
sayHelloNow {
    print("Hi bro, just answer here")    
}
// Escaping Closure
// Sample 1
var tasks: [() -> Void] = []
func sayHelloLater(closure: @escaping () -> Void) {
    tasks.append(closure)
}
sayHelloLater {
    print("Relax bro, you can answer later")
}
tasks.first?()
// Escaping sample -> real case
let semaphore = DispatchSemaphore(value: 0)
struct User: Decodable {
    let name: String
    let email: String
}
// Netwoking Manager
class NetworkManager {
    func fetchUser(completion: @escaping (User?) -> Void) {
        // API Delay Simulation
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            // Data simulation successfully taken
            let dummyUser = User(name: "Tama", email: "tama@gmail.com")
            // When finished, call the closure
            completion(dummyUser)
            semaphore.signal()
        }
    }
}
// Use -> Network Manager
let network = NetworkManager()
print("⏳ Menunggu respon dari API...")
network.fetchUser { user in
    if let user = user {
        print("Nama user: \(user.name)")
        print("Email user: \(user.email)")
    } else {
        print("Gagal ambil data.")
    }
}
semaphore.wait()
// Sample 2
var completionHandlers: [() -> Void] = []
let semaphore1 = DispatchSemaphore(value: 0)
func fetchDataFromServer(completion: @escaping () -> Void) {
    print("Start fetching data from server")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        print("Data has been retrieved")
        completion()
        semaphore1.signal()
    }
}

// DISINI ADA DEATHLOCK BROO, HANG PROGRAMNYA, CEK LAGI TAR YEE

fetchDataFromServer {
    print("🧠 Update UI after data is complete")
}
print("📱 UI can still be used while waiting for data...")
semaphore1.wait()