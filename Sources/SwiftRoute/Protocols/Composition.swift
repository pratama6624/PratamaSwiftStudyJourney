protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

// Name + age in the same time
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)")
}

let malcolm = Person(name: "Malcolm", age: 25)
wishHappyBirthday(to: malcolm)


// Sample 2
class Location {
    var latitude: Double
    var longitude: Double

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert(in location: Location & Named) {
    print("Welcome to \(location.name)!")
}

let seattle = City(name: "Seattle", latitude: 46.7, longitude: -122.3)
beginConcert(in: seattle)


// Real Case
protocol FormValidatable {
    func validateForm()-> Bool
}

protocol UIViewController { }

class LoginViewController: UIViewController, FormValidatable {
    func validateForm() -> Bool {
        return true
    }
}

func presentIfValid(_ vc: UIViewController & FormValidatable) {
    if vc.validateForm() {
        print("Form valid, presenting screen")
    } else {
        print("Invalid form, cannot present")
    }
}

let loginVC = LoginViewController()
presentIfValid(loginVC)