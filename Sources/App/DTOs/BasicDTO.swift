//
//  BasicDTO.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 09/03/25.
//

import Vapor
import Fluent

struct BasicDTO: Content {
    var id: UUID?
    var fullname: String?
    var nickname: String?
    var age: Int?
    var height: Double?
    var weight: Double?
    var bloodType: String?
    var isMarriage: Bool?
    
    // Constanst
    var hobbies: [String]?
    var uniqueSkills: [String]?
    var contactInfo: ContactInfo?
}
