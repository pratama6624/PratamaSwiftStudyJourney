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
    
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
        print("Data has been retrieved")
        completion()
        semaphore1.signal()
    }
}
fetchDataFromServer {
    print("🧠 Update UI after data is complete")
}
print("📱 UI can still be used while waiting for data...")
semaphore1.wait()
// Sample 3
func fetchUserName(completion: @escaping (String) -> Void) {
    print("⏳ Fetching user data...")
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
        let fetchedName = "John Appleseed"
        completion(fetchedName)
    }
}
fetchUserName { name in
    print("✅ User name fetched: \(name)")
}
RunLoop.main.run(until: Date().addingTimeInterval(3))

// Autoclosures
func checkPermission(_ validation: @autoclosure () -> Bool) {
    print("Check permit")
    if validation() {
        print("✅ Access granted")
    } else {
        print("❌ Access denied")
    }
}
let userHasAdminRole = false
checkPermission(userHasAdminRole == true)
// Without @autoclosure -> checkPermission( { userHasAdminRole == true } )

// From apple docs
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
let customerProvider = { customersInLine.remove(at: 0)}
print(customersInLine.count)
print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Without autoclosure
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) })
// With autoclosure
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))

// Autoclosure + Escaping
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))
print("Collected \(customerProviders.count) closures.")
for customerProvider in customerProviders {
     print("Now serving \(customerProvider())!")
}