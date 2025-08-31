import Foundation

// Basic Sample
protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.14159
    let radius: Double
    var area: Double { pi * radius * radius }
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
    if let withArea = object as? HasArea {
        print("Area = \(withArea.area)")
    } else {
        print("❌ No area property here")
    }
}


// Real Case
struct MySize {
    var width: Int
    var height: Int
}

protocol Resizable {
    func resize(to size: MySize)
}

protocol UIView { }

class Button: UIView, Resizable {
    private var frameSize = MySize(width: 0, height: 0)

    func resize(to size: MySize) {
        self.frameSize = size
        print("Button resized to \(size)")
    }
}

class Label: UIView { }

let views: [UIView] = [
    Button(),
    Label(),
    Button()
]

for view in views {
    if let resizableView = view as? Resizable {
        resizableView.resize(to: MySize(width: 100, height: 40))
    } else {
        print("This view can’t be resized")
    }
}