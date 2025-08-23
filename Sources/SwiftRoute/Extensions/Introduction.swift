import Foundation

extension Double {
    var km: Double { self * 1000.0 }
    var m: Double { self }
    var cm: Double { self / 100.0 }
    var mm: Double { self / 1000.0 }

    var asRupiah: String {
        let formatter =  NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "IDR"
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self)) ?? "Rp0"
    }
}

let distance = 5.0.km
print("Distance: \(distance) meters")

let price = 1500000.0
print(price.asRupiah) // "Rp1.500.000"

extension Date {
    func toReadableFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}

let now = Date()
print("Sekarang: \(now.toReadableFormat())")
// Output: Sekarang: Aug 22, 2025 at 11:30 AM

extension String {
    var isValidEmail: Bool {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: self)
    }
}

let email = "pratama@example.com"
print(email.isValidEmail) // true