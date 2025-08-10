import Foundation

// Sendable struct
struct TemperatureReading: Sendable {
    var measurement: Int
}

// Actor
actor TemperatureLogger {
    var measurements: [Int] = []

    func addReading(from reading: TemperatureReading) {
        measurements.append(reading.measurement)
    }
}

let logger = TemperatureLogger()
let reading = TemperatureReading(measurement: 45)

Task {
    await logger.addReading(from: reading)
    await print(logger.measurements)
}