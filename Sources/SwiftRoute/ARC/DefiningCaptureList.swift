import Foundation

class MyViewController {
    var dataProcessor: ((Int, String) -> String)?

    var delegate: SomeDelegate?

    func setupClosure() {
        dataProcessor = {
            [unowned self, weak delegate = self.delegate](index: Int, stringToProcess: String) -> String in

            // self di-capture sebagai unowned
            print("Index \(index) di \(self)")

            // delegate di-capture sebagai weak, jadi optional
            delegate?.didProcess(stringToProcess)
            
            return "\(index): \(stringToProcess.uppercased())"
        }
    }
}