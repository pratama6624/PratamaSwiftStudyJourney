import Foundation

public class Ticket {
    fileprivate func printInternalCode() {
        print("Internal code printed")
    }

    public func show() {
        print("Regular Ticket")
    }
}

// Same modul
internal class VIPTicket: Ticket {
    override internal func show() {
        super.show()
        print("VIP Upgrade")
        
        super.printInternalCode()
    }
}

var vip = VIPTicket()
vip.show()