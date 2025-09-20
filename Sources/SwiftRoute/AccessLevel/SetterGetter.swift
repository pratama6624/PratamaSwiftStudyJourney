import Foundation

public struct Product {
    public private(set) var updateCount = 0

    public var stock: Int = 0 {
        didSet {
            updateCount += 1
        }
    }

    public init(stock: Int) {
        self.stock = stock
    }
}

var item = Product(stock: 20)

item.stock = 15
item.stock = 20

print("Stok sudah diubah \(item.updateCount) kali")