import Foundation

class Country {
    let name: String
    var capitalCity: City! // Implisitly Unwrapped Optional

    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country // Unowned Reference

    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is \(country.capitalCity.name)")
// Prints "Canada's capital city is Ottawa"