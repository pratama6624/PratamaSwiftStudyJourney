import Foundation

// File : Example.swift

// Public type
public struct Employee {
    public var name: String
    public init(name: String) { self.name = name }
}

// Internal type
internal struct SalaryData {
    var amount: Double
    init(amount: Double) { self.amount = amount }
}

// public typealias ke public type = valid
public typealias Staff = Employee

// internal typealias ke internal type = valid
internal typealias Salary = SalaryData

public func hire(_ staff: Staff) {
    print("Hired: \(staff.name)")
}

internal func pay(_ salary: Salary) {
    print("Paid: \(salary.amount)")
}

// How to use it
let newStaff = Staff(name: "Pratama")
hire(newStaff)

let gaji = Salary(amount: 10_000_000)
pay(gaji)