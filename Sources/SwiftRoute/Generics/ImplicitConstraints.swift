import Foundation

struct RegularItem {
    var name: String
}

struct SpecialTicket: CustomStringConvertible/*: ~Copyable */ {
    var code: String

    var description: String {
        return "SpecialTicket(code: \(code))"
    }
}

func duplicateItem<Item>(x: inout Item) {
    let copy1 = x   // implicit copy ok
    let _ = x   // implicit copy ok
    print("Item duplicated twice: \(copy1)")
}

func handleTicket<Ticket: CustomStringConvertible>(t: inout Ticket) {
    let first = t
    print("Handle ticket: \(first)")
}

var shirt = RegularItem(name: "Kaos Swift")
duplicateItem(x: &shirt)

var ticket = SpecialTicket(code: "VIP-123")

handleTicket(t: &ticket) 
