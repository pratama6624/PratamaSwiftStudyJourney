import Foundation

@objc protocol UIControlDelegate {
    @objc optional func didTap()
    @objc optional func didLongPress()
}

class Button {
    var delegate: UIControlDelegate?

    func simulateTap() {
        print("Button tapped!")
        delegate?.didTap?()
    }

    func simulateLongPress() {
        print("Button long-pressed!")
        delegate?.didLongPress?()
    }
}

// MARK: - Conformers
class TapHandler: NSObject, UIControlDelegate {
    func didTap() {
        print("✅ TapHandler: handling tap")
    }
    // didLongPress tidak diimplement -> aman
}

class LongPressHandler: NSObject, UIControlDelegate {
    func didLongPress() {
        print("✅ LongPressHandler: handling long press")
    }
    // didTap tidak diimplement -> aman
}

// MARK: - Test
let button = Button()
button.delegate = TapHandler()
button.simulateTap()        // Ada handler
button.simulateLongPress()  // Ga ada handler -> gak crash

button.delegate = LongPressHandler()
button.simulateTap()        // Ga ada handler -> gak crash
button.simulateLongPress()  // Ada handler