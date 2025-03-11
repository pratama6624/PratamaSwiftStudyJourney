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
    var blood_type: String?
    var is_marriage: Bool?
    
    // Constanst
    var hobbies: [String]?
    var unique_skills: [String]?
    var contact_info: ContactInfo?
}
