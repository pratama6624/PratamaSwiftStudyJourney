import Foundation

extension Double {
    enum Currency: String {
        case idr = "Rp"
        case usd = "$"
        case eur = "€"
    }

    func asCurrency(_ currency: Currency) -> String {
        switch currency {
            case .idr:
                return "\(currency.rawValue)\(String(format: "%.0f", self))"
            case .usd, .eur:
                return "\(currency.rawValue)\(String(format: "%.2f", self))"
        }
    }
}

let hargaBarang: Double = 150_000
print(hargaBarang.asCurrency(.idr)) // Rp15000
print(hargaBarang.asCurrency(.usd)) // $15000.00
print(hargaBarang.asCurrency(.eur)) // €15000.00