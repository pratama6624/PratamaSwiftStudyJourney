// Initialization
// Setting Initial Values for Stored Properties
struct Fahrenheit {
    var temperature: Double
    init() {
        // Default Property Values
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")

// Customizing Initialization
// Initialization Parameters
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print("Boiling of water is \(boilingPointOfWater)")
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print("Freezing of water is \(freezingPointOfWater)")

// Parameter Names and Argument Labels
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
print("Magenta is \(magenta)")
let halfGray = Color(white: 0.5)
print("Half Gray is \(halfGray)")

// Initializer Parameters Without Argument Labels
let bodyTemperature = Celsius(37.0)
print("Body Temperature is \(bodyTemperature)")



