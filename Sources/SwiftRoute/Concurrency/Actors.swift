actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int

    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }

    func update(with measurement: Int) {
        measurements.append(measurement)
        if measurement > max {
            max = measurement
        }
    }
}

// Pemakaian
let logger = TemperatureLogger(label: "Outdoor", measurement: 25)

// Akses dari luar actor -> harus pakai await
Task {
    print(await logger.max) // 25
    await logger.update(with: 30)
    print(await logger.max) // 30
}