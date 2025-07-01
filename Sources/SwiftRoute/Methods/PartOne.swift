// Instance Methods
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by: Int) {
        count += by
    }
    func reset() {
        count = 0
    }
}
let counter = Counter()
counter.increment()
print("Counter : \(counter.count)")
counter.increment(by: 5)
print("Counter : \(counter.count)")
counter.reset()
print("Counter : \(counter.count)")