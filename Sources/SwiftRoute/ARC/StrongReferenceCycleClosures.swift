class HTMLElement {
    let name: String
    let text: String?

    // cloruse
    // [unowned self] in => Resolving Strong Reference Cycles for Closures
    lazy var asHTML: () -> String = { // [unowned self] in
        if let text: String = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

// TEST
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())  // "<p>hello, world</p>"
paragraph = nil             // tidak muncul "is being deinitialized" -> cycle